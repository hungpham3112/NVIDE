return {
    "https://github.com/windwp/nvim-autopairs.git",
    event = "InsertEnter",
    opts =
    {
        enable_check_bracket_line = true
    },
    -- config = function()
    --     local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    --
    --     require("blink-cmp").setup({
    --         keymap = {
    --             ["<CR>"] = {
    --                 function(cmp)
    --                     return cmp.accept({
    --                         callback = cmp_autopairs.on_confirm_done
    --                     })
    --                 end
    --             }
    --         }
    --     })
    -- end
}
