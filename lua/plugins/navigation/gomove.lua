return {
    'https://github.com/booperlv/nvim-gomove.git',
    opts = {
        map_defaults = false
    },
    config = function()
        local map = vim.api.nvim_set_keymap

        map("x", "<S-h>", "<Plug>GoVSMLeft", {})
        map("x", "<S-j>", "<Plug>GoVSMDown", {})
        map("x", "<S-k>", "<Plug>GoVSMUp", {})
        map("x", "<S-l>", "<Plug>GoVSMRight", {})
    end
}
