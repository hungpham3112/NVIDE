return {
    'https://github.com/nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' },
    keys = {
        {"<leader>fc", ":lua require('core.keymaps').pick_directory()<CR>", desc = "Open (C)ustom Directory"},
        {"<leader>ff", ":Telescope find_files<CR>", desc = "Find (F)iles"},
        {"<leader>fg", ":Telescope live_grep<CR>", desc = "Live (G)rep"},
        {"<leader>fp", ":lua require('telescope').extensions.project.project()<CR>", desc = "Open (P)roject"},
    },
    opts = {
        defaults = {
            path_display = {"smart"},
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                }
            },
            sorting_strategy = "ascending",
            --  Hiện tại  chưa rõ rằng  dùng cái fzf sorter kia kiểu 
            --   Vấn đề nằmở  document  ghi rất khó.hiểu
            --file_sorter = require('telescope').extensions.fzf.native_fzf_sorter(),
            --generic_sorter = require('telescope').extensions.fzf.native_fzf_sorter(),
        },
        pickers = {
            find_files = {
                hidden = true,
            }
        }

    },
    config = function(_, opts) 
        -- You need to load opts before using 
        require('telescope').setup(opts) 
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('project')
        -- require('telescope').load_extension('media_files')
    end,
}
