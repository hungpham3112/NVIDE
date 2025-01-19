return {
    "https://github.com/williamboman/mason-lspconfig.nvim.git",
    lazy = false,
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls" },
        })
    end
}
