local M = {}
-- Create a keymapping
vim.keymap.set('n', "<C-a>", "ggVG<Cr>", { noremap = true})

-- Windows navigation
vim.keymap.set('n', "<C-j>", "<C-W><C-j>", { noremap = true})
vim.keymap.set('n', "<C-k>", "<C-W><C-k>", { noremap = true})
vim.keymap.set('n', "<C-l>", "<C-W><C-l>", { noremap = true})
vim.keymap.set('n', "<C-h>", "<C-W><C-h>", { noremap = true})

-- Buffer navigation
vim.keymap.set('n', "<Tab>", ":bnext<CR>", { noremap = true})
vim.keymap.set('n', "<S-Tab>", ":bpre<CR>", { noremap = true})
vim.keymap.set('n', "<S-l>", ":tabnext<CR>", { noremap = true})
vim.keymap.set('n', "<S-h>", ":tabprevious<CR>", { noremap = true})
-- Remap <C-/> to comment in normal mode
-- Toggle comments using Ctrl-/

-- Set clipboard to use system clipboard (unnamedplus)
vim.opt.clipboard:append("unnamedplus")

local telescope = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

M.pick_files_in_directory = function(directory)
    telescope.find_files({
      prompt_title = "Pick a File",
      cwd = directory,
      no_ignore = true,
      hidden = true
    })
end

M.pick_directory = function()
  telescope.find_files({
    prompt_title = "Pick a Directory",
    find_command = { 'fd', '--type', 'd', '-H', '--exclude', '.git/', '.', 'C:\\' },
    
    attach_mappings = function(prompt_bufnr, map)
      local select_directory = function()
        local selection = action_state.get_selected_entry()
        if selection then
          actions.close(prompt_bufnr)
          
          local dir_path = selection.path
          vim.cmd('cd ' .. vim.fn.fnameescape(dir_path))
          

          M.pick_files_in_directory(dir_path)
        end
      end
      
      map('i', '<CR>', select_directory)
      map('n', '<CR>', select_directory)
      
      return true
    end
  })
end

return M
