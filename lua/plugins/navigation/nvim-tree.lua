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
        actions = {
            expand_all = {
                max_folder_discovery = 1000,
                exclude = { ".git", "target", "build" },
            },
        },
        sync_root_with_cwd = true,
        reload_on_bufenter = true,
        respect_buf_cwd = true,
        -- Update root có nghĩa là nó nhảy về thư mục
        -- chứa cái file mà mình cần với depth = 1
        -- tức là nó chỉ hiện mỗi parent directory
        -- còn nó xóa hết những structure còn lại.
        update_focused_file = {
            enable = true,
        }
    },
}
