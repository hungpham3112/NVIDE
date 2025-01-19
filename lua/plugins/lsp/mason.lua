return {
    "https://github.com/williamboman/mason.nvim.git",
    lazy = false,
    keys = {
        { "<leader>m", ":Mason<CR>", desc = "(M)ason", noremap = true, silent = true },
    },
    config = function()
        require("mason").setup()
    end
}
