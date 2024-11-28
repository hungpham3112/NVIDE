return {
    "https://github.com/nvim-tree/nvim-tree.lua.git",
    version = "*",
    dependencies = {
        "https://github.com/nvim-tree/nvim-web-devicons.git",
    },
    keys = {
        { "<leader>e", ":NvimTreeToggle<CR>", desc = "(E)xplorer" },
    },
    config = function ()
        require('nvim-tree').setup()
    end
}
