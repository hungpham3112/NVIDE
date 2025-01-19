return {
    "https://github.com/nvim-treesitter/nvim-treesitter.git",
    opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "rust" },
        sync_install = true,
    },
    build = ":TSUpdate",
}
