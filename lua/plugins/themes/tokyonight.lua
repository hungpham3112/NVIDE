return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        style = "moon",
        -- transparent = true,
        -- on_colors = function(colors)
        --     colors.bg_statusline = "NONE"
        --     colors.bg_statusline_inactive = "NONE"
        -- end,
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd.colorscheme("tokyonight")
    end,
}
