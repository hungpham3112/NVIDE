return {
    "https://github.com/nvim-tree/nvim-tree.lua.git",
    version = "*",
    lazy = false,
    dependencies = {
        "https://github.com/nvim-tree/nvim-web-devicons.git",
    },
    keys = {
        { "<leader>e", ":NvimTreeFindFileToggle<CR>", desc = "(E)xplorer", noremap = true, silent = true },
    },
    opts = {
        view = {
            side = "right", -- Open the tree on the right side
            width = 40,     -- Width of the tree window
        },
        -- Update root có nghĩa là nó nhảy về thư mục
        -- chứa cái file mà mình cần với depth =
        -- tức là nó chỉ hiện mỗi parent directory
        -- còn nó xóa hết những structure còn lại.
        update_focused_file = {
            enable = true,
        }
    },
}
