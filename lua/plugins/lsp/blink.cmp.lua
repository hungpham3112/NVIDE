return {
    'https://github.com/Saghen/blink.cmp.git',
    version = '*',
    opts =
    {
        completion =
        {
            keyword =
            {
                range = 'full',
            },

            accept =
            {
                auto_brackets =
                {
                    enabled = false
                },
            },

            list =
            {
                selection =
                {
                    preselect = true,
                    auto_insert = true
                }
            },


            -- 4:22 PM Tue Mar 18, hom nay dang gap phai loi khong render duoc icon
            -- da phan la do blink.cmp API đang chưa thống nhất với các plugin khác
            -- hoặc document chưa rõ ràng.
            -- https://github.com/Saghen/blink.cmp/discussions/1146
            -- menu = {
            --     draw = {
            --         components = {
            --             kind_icon = {
            --                 ellipsis = false,
            --                 text = function(ctx)
            --                     local lspkind = require("lspkind")
            --                     local icon = ctx.kind_icon
            --                     if vim.tbl_contains({ "Path" }, ctx.source_name) then
            --                         local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
            --                         if dev_icon then
            --                             icon = dev_icon
            --                         end
            --                     else
            --                         icon = require("lspkind").symbolic(ctx.kind, {
            --                             mode = "symbol",
            --                         })
            --                     end
            --
            --                     return icon .. ctx.icon_gap
            --                 end,
            --
            --                 -- Optionally, use the highlight groups from nvim-web-devicons
            --                 -- You can also add the same function for `kind.highlight` if you want to
            --                 -- keep the highlight groups in sync with the icons.
            --                 highlight = function(ctx)
            --                     local hl = ctx.kind_hl
            --                     if vim.tbl_contains({ "Path" }, ctx.source_name) then
            --                         local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
            --                         if dev_icon then
            --                             hl = dev_hl
            --                         end
            --                     end
            --                     return hl
            --                 end,
            --             }
            --         }
            --     }
            -- },
            --     -- auto_show = function(ctx)
            --     --     print("Context object:")
            --     --     print(vim.inspect(ctx))
            --     --     return ctx.mode ~= "cmdline" or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
            --     -- end,
            --     -- Mon Jan 13: 11:02 PM đoạn code bên trên không hoạt
            --     -- động do auto-show đáng nhẽ phải work ở trên normal
            --     -- mode nhưng không, do đó set tạm bằng true vì đằng nào ở dưới cũng disable cmdline mode rồi
            documentation =
            {
                auto_show = true,
                auto_show_delay_ms = 100,
            },

            ghost_text = { enabled = true }

        },

        keymap = {
            preset = 'none',
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },

            ['<C-f>'] = { 'snippet_forward', 'fallback' },
            ['<C-b>'] = { 'snippet_backward', 'fallback' },

            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },

            ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

        },
        -- Sources are interface of blink.cmp for getting LSP's suggestions
        cmdline = {
            enabled = false,
        },

        sources =
        {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            -- Disable autocomplete for cmdline mode
        },
        -- Highlight the augument suggestions when typing
        signature =
        {
            enabled = true,
        },

        appearance =
        {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'mono',
        }
    }
}
