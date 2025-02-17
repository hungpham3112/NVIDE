return {
    "https://github.com/neovim/nvim-lspconfig.git",
    lazy = true,
    dependencies = { "https://github.com/Saghen/blink.cmp.git" },
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        -- Configure each server directly
        require('lspconfig').clangd.setup({ capabilities = capabilities })
        require('lspconfig').lua_ls.setup({ capabilities = capabilities })
        require('lspconfig').pyright.setup({ capabilities = capabilities })
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then return end

                if client.supports_method('textDocument/formatting') then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnf = args.buf, id = client.id })
                        end
                    })
                end
            end
        })
    end
}
