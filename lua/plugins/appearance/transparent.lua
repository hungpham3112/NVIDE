return {
    -- Hướng dẫn sử dụng, tìm color group các mode của từng plugin
    -- sau đó ghi vào đây là được
    "https://github.com/xiyaowong/transparent.nvim.git",
    opts = {
        extra_groups = {
            -- Nvim-Tree
            "NvimTreeNormal",   -- Focused nvim-tree
            "NvimTreeNormalNC", -- Unfocused nvim-tree

            -- Telescope
            "TelescopeNormal",

            -- Whichkey
            "WhichKeyNormal",
            "WhichKeyBorder",

            -- Blink.cmp
            "BlinkCmpMenu",
            "BlinkCmpMenuBorder",
            "BlinkCmpDoc",
            "BlinkCmpDocBorder",

            "lualine_c_normal",
            "lualine_x_normal",

            -- Chế độ Insert
            "lualine_c_insert",
            "lualine_x_insert",

            -- Chế độ Visual
            "lualine_c_visual",
            "lualine_x_visual",

            -- Chế độ Replace
            "lualine_c_replace",
            "lualine_x_replace",

            -- Chế độ Command
            "lualine_c_command",
            "lualine_x_command",

            -- Chế độ Inactive (cho các cửa sổ không focus)
            "lualine_c_inactive",
            "lualine_x_inactive",
        },
    }
}
