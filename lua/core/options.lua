-- General settings
vim.opt.titlestring = "VIDE"                                    -- Change title vim
vim.g.mapleader = " "                                            -- Map leader to Space for convenience
vim.opt.autoindent = true                                        -- Auto indent
vim.opt.autoread = true                                          -- Read file if it has been changed outside
vim.opt.autowriteall = true                                      -- Autowrite if file has been modified
vim.opt.background = "dark"                                      -- Dark background
vim.opt.backspace = { "indent", "eol", "start" }                 -- Delete using backspace
vim.opt.belloff = "all"                                          -- Disable all sound effects
vim.opt.cmdheight = 2                                            -- 1 is the best but 2 can disable 'Press Enter'
vim.opt.confirm = true                                           -- Choose options (Y/N)
vim.opt.encoding = "utf-8"                                       -- String-encoding
vim.opt.hidden = true                                            -- Turn off E37 when change file
vim.opt.history = 10000                                          -- Show maximum recently history
vim.opt.hlsearch = true                                          -- Highlight patterns
vim.opt.ignorecase = true                                        -- Ignore case-sensitive in search patterns
vim.opt.incsearch = true                                         -- Highlight pattern when searching
vim.opt.laststatus = 3                                           -- Show global status line
vim.opt.linespace = 8                                            -- Gap between line (easier to see text) (only for GUI)
vim.opt.showmode = false                                         -- Turn off default status line
vim.opt.equalalways = false                                      -- Turn off automatically resize
vim.opt.swapfile = false                                         -- Don't generate swapfile
vim.opt.nrformats:remove("octal")                                -- Remove consideration starting with 0 as octal
vim.opt.number = true                                            -- Show current line
vim.opt.scrolloff = 6                                            -- Scroll with 5 lines at the end of the page
vim.opt.shortmess:append("cT")                                   -- Avoid hit-enter prompts
vim.opt.showtabline = 2                                          -- Always show tabline
vim.opt.sidescroll = 1                                           -- The minimal number of columns to scroll horizontally
vim.opt.signcolumn = "number"                                    -- Display signs in the 'number' column
vim.opt.splitbelow = true                                        -- Open file in reasonable location
vim.opt.splitright = true                                        -- Open file in reasonable location
vim.opt.tabstop = 4          -- Number of spaces that a <Tab> counts for
vim.opt.expandtab = true     -- Convert tabs to spaces
vim.opt.shiftwidth = 4       -- Number of spaces used for autoindent
vim.opt.termguicolors = true                                     -- Colors for terminal
vim.opt.textwidth = 120                                          -- Maximum width of text in buffer
vim.opt.timeout = true                                           -- Timeout enabled
vim.opt.timeoutlen = 200                                         -- Time response keystroke
vim.opt.ttimeoutlen = 50                                         -- Time response keystroke
vim.opt.updatetime = 200                                         -- Make autocomplete faster
vim.opt.viewoptions:remove("options")                            -- Change behavior :mkview
vim.opt.wildignorecase = true                                    -- Ignore case-sensitive command-mode
