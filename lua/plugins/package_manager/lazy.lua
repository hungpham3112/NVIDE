-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { import = "plugins.themes" },
        { import = "plugins.navigation" },
        { import = "plugins.lsp" },
        { import = "plugins.appearance" },
        { import = "plugins.utils" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "telescope" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
    vim.keymap.set('n', "<leader>p", ":Lazy<CR>", { desc = "(P)ackage Manager", noremap = true })
})
