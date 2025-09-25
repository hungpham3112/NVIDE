return {
    "https://github.com/neovim/nvim-lspconfig.git",
    lazy = false,
    dependencies = { "https://github.com/Saghen/blink.cmp.git" },
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        local on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }

            -- Go-to features
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)      -- Go to definition
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)     -- Go to declaration
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)  -- Go to implementation
            vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts) -- Go to type definition
            -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)      -- Find references
            -- Find references (like VSCode "Find all references")
            vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { noremap = true })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- Hover docs

            -- Rename + Code actions
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

            -- Diagnostics
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            vim.keymap.set('n', '<leader>o', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

            -- Auto-format on save
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 1000 })
                    end
                })
            end

            if client.supports_method("textDocument/inlayHint") then
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end
        end


        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                local bufnr = args.buf
                on_attach(client, bufnr)

                -- merge capabilities (nếu server chưa có)
                client.server_capabilities = vim.tbl_deep_extend(
                    "force",
                    client.server_capabilities,
                    capabilities
                )
            end,
        })
    end
}
