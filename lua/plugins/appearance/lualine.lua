return {
    "https://github.com/nvim-lualine/lualine.nvim.git",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            icons_enabled = true,
            theme = "auto",
        },

        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = {
                {
                    path = 3, -- 3: Absolute path, with tilde as the home directory
                    shorting_target = 40,
                }
            },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },

        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
                {
                    'filename',
                    path = 3, -- 1 = đường dẫn tương đối
                }
            },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
    },
}
