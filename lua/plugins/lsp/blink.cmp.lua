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

            list =
            {
                selection =
                {
                    preselect = true,
                    auto_insert = true
                }
            },


            -- menu =
            -- {
            --     -- auto_show = function(ctx)
            --     --     print("Context object:")
            --     --     print(vim.inspect(ctx))
            --     --     return ctx.mode ~= "cmdline" or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
            --     -- end,
            --     -- Mon Jan 13: 11:02 PM đoạn code bên trên không hoạt
            --     -- động do auto-show đáng nhẽ phải work ở trên normal
            --     -- mode nhưng không, do đó set tạm bằng true vì đằng nào ở dưới cũng disable cmdline mode rồi
            -- },
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
        sources =
        {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            -- Disable autocomplete for cmdline mode
            cmdline = {},
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
