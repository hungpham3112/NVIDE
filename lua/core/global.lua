-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " " -- Map leader to Space for convenience
vim.keymap.del('n', "grn")
vim.keymap.del('n', "gra")
vim.keymap.del('n', "grt")
vim.keymap.del('n', "gri")
vim.keymap.del('n', "grr")

function _G.smart_bdelete()
    local cur_buf = vim.api.nvim_get_current_buf()
    vim.cmd('bnext') -- switch to next buffer
    if cur_buf ~= vim.api.nvim_get_current_buf() then
        vim.cmd('bdelete ' .. cur_buf)
    end
end

vim.keymap.set('n', '<leader>bd', ':lua smart_bdelete()<CR>', { desc = 'Smart delete buffer' })
