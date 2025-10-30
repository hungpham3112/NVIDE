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
        vim.wo.cursorline = true   -- Enable cursorline
        vim.wo.cursorcolumn = true -- Enable cursorcolumn
    end,
})


vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.buftype == "help" then
            vim.cmd("wincmd L") -- Move the help window to the right
        end
    end,
})

vim.api.nvim_create_augroup("dynamic_smartcase", { clear = true })

vim.api.nvim_create_autocmd("CmdLineEnter", {
    group = "dynamic_smartcase",
    pattern = ":",
    callback = function()
        vim.opt.smartcase = false -- Disable smartcase in command-line mode
    end,
})

vim.api.nvim_create_autocmd("CmdLineLeave", {
    group = "dynamic_smartcase",
    pattern = ":",
    callback = function()
        vim.opt.smartcase = true -- Re-enable smartcase when leaving command-line mode
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
    callback = function()
        vim.notify("File reloaded (changed externally)", vim.log.levels.INFO)
    end,
})
