return {
    "https://github.com/nvim-tree/nvim-tree.lua.git",
    version = "*",
    lazy = false,
    dependencies = {
        "https://github.com/nvim-tree/nvim-web-devicons.git",
    },
    keys = {
        { "<leader>e", ":NvimTreeToggle<CR>", desc = "(E)xplorer", noremap = true, silent = true },
    },
    opts = {
        view = {
            side = "right", -- Open the tree on the right side
            width = 40,     -- Width of the tree window
        },
    },
}
