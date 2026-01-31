-- Basic Auto Commands
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    command = "silent! lcd %:p:h",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "*" },
    callback = function()
        vim.opt.formatoptions:remove("o")
        vim.opt.formatoptions:append("j")
    end
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        vim.wo.cursorline = true
        vim.wo.cursorcolumn = true
    end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.buftype == "help" then
            vim.cmd("wincmd L")
        end
    end,
})

-- Smartcase handling for command line
vim.api.nvim_create_augroup("dynamic_smartcase", { clear = true })

vim.api.nvim_create_autocmd("CmdLineEnter", {
    group = "dynamic_smartcase",
    pattern = ":",
    callback = function()
        vim.opt.smartcase = false
    end,
})

vim.api.nvim_create_autocmd("CmdLineLeave", {
    group = "dynamic_smartcase",
    pattern = ":",
    callback = function()
        vim.opt.smartcase = true
    end,
})

-- ============================================================================
-- JUST-IN-TIME LIVE RELOAD & NOTIFY (E211 Suppressed - Best Effort)
-- ============================================================================

-- Global tables to persist watchers across config reloads
_G.ns_file_watchers = _G.ns_file_watchers or {}
_G.ns_debounce_timers = _G.ns_debounce_timers or {}

local DEBOUNCE_DELAY = 200 -- ms
local uv = vim.uv or vim.loop
local api = vim.api
local fn = vim.fn

-- Safely cleanup watchers and timers
local function cleanup_resources(bufnr)
    local w = _G.ns_file_watchers[bufnr]
    if w then
        if not w:is_closing() then w:stop() end
        _G.ns_file_watchers[bufnr] = nil
    end

    local t = _G.ns_debounce_timers[bufnr]
    if t then
        if not t:is_closing() then
            t:stop()
            t:close()
        end
        _G.ns_debounce_timers[bufnr] = nil
    end
end

-- Logic to reload buffer or flag deletion
local function on_change_logic(bufnr, full_path)
    if not api.nvim_buf_is_valid(bufnr) then
        cleanup_resources(bufnr)
        return
    end

    local modified_ok, modified = pcall(api.nvim_get_option_value, "modified", { buf = bufnr })
    if not modified_ok or modified then return end

    local exists = fn.filereadable(full_path) == 1

    if exists then
        -- HAPPY PATH: File exists, reload content
        pcall(api.nvim_buf_set_var, bufnr, "file_deleted_on_disk", false)
        
        -- Re-enable autoread if it was disabled
        api.nvim_set_option_value("autoread", true, { buf = bufnr })
        
        if fn.bufwinnr(bufnr) ~= -1 then
            vim.cmd("silent! checktime " .. fn.fnameescape(full_path))
            vim.cmd("redraw!")
        end
    else
        -- DANGER PATH: File deleted or moved
        -- Disable autoread immediately to prevent Neovim from checking and throwing E211
        api.nvim_set_option_value("autoread", false, { buf = bufnr })
        
        -- Flag for notification
        pcall(api.nvim_buf_set_var, bufnr, "file_deleted_on_disk", true)
    end
end

local function start_fs_watcher(bufnr)
    -- Validate buffer path
    local full_path = api.nvim_buf_get_name(bufnr)
    if full_path == "" then return end
    
    local buftype_ok, buftype = pcall(api.nvim_get_option_value, "buftype", { buf = bufnr })
    if not buftype_ok or buftype ~= "" then return end

    -- Prevent duplicate watchers
    if _G.ns_file_watchers[bufnr] then return end

    local dir = fn.fnamemodify(full_path, ":h")
    local filename = fn.fnamemodify(full_path, ":t")

    local w = uv.new_fs_event()
    if not w then return end

    local on_change_callback = vim.schedule_wrap(function(err, fname, status)
        if err then return end
        if fname == filename or fname == nil then
            local old_t = _G.ns_debounce_timers[bufnr]
            if old_t and not old_t:is_closing() then old_t:stop() end
            
            local t = uv.new_timer()
            if not t then return end
            _G.ns_debounce_timers[bufnr] = t
            
            t:start(DEBOUNCE_DELAY, 0, vim.schedule_wrap(function()
                on_change_logic(bufnr, full_path)
                
                local current_t = _G.ns_debounce_timers[bufnr]
                if current_t and not current_t:is_closing() then
                    current_t:close()
                end
                _G.ns_debounce_timers[bufnr] = nil
            end))
        end
    end)

    w:start(dir, {}, on_change_callback)
    _G.ns_file_watchers[bufnr] = w
end

-- Initialize watcher on buffer enter
api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function(ev)
        start_fs_watcher(ev.buf)
    end
})

-- Handle notifications when the user focuses on the buffer
api.nvim_create_autocmd({ "FocusGained", "BufEnter", "WinEnter" }, {
    pattern = "*",
    callback = function(ev)
        local bufnr = ev.buf
        if bufnr ~= api.nvim_get_current_buf() then return end

        local deleted_flag_exists, deleted = pcall(api.nvim_buf_get_var, bufnr, "file_deleted_on_disk")
        
        if deleted_flag_exists and deleted then
            pcall(api.nvim_buf_set_var, bufnr, "file_deleted_on_disk", false)
            
            local filename = fn.fnamemodify(api.nvim_buf_get_name(bufnr), ":t")
            
            vim.schedule(function()
                -- Trick: Clear command line to hide E211 if possible
                api.nvim_echo({{ "", "" }}, false, {})
                
                vim.notify(
                    "File '" .. filename .. "' deleted on disk!\nBuffer content kept in memory.",
                    vim.log.levels.ERROR,
                    {
                        title = "File Watcher: " .. filename,
                        timeout = 10000, -- 10 seconds timeout
                    }
                )
            end)
        end
    end
})

-- Cleanup watcher when buffer is wiped
api.nvim_create_autocmd("BufWipeout", {
    pattern = "*",
    callback = function(ev)
        cleanup_resources(ev.buf)
    end
})