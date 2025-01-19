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
    end
}
