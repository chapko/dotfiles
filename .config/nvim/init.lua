vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Keymaps {{{

vim.keymap.set({ "i", "c" }, "jj", "<ESC>", { noremap = true })
vim.keymap.set({ "i", "c" }, "jk", "<ESC>", { noremap = true })

vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", "Y", "yy", { noremap = true })
vim.keymap.set("n", ",n", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", ",w", ":setlocal wrap!<CR>", { silent = true })

vim.keymap.set("n", "<S-Space>", ";", { noremap = true })
vim.keymap.set("n", "<C-Space>", ",", { noremap = true })

-- very magic (:h \v)
vim.keymap.set("n", "<A-/>", "/\\v", { noremap = true })

-- more natural navigation on wrapped lines
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

vim.keymap.set("i", "<C-r><C-r>", "<C-r>+", { noremap = true })

vim.keymap.set("n", "<A-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<A-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<A-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<A-l>", "<C-w>l", { noremap = true })

vim.keymap.set("n", "<M-{>", ":tabprevious<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<M-}>", ":tabnext<CR>", { silent = true, noremap = true })

-- Diff {{{

-- diff side with base
vim.keymap.set("n", "<A-1>", function()
    print 'TODO <A-1>';
end, {});

vim.keymap.set("n", "<A-3>", function()
    print 'TODO <A-3>'
end, {});

-- diff all
vim.keymap.set("n", "<A-2>", function()
    print "TODO <A-2>"
end, {});

-- diff side with conflict
vim.keymap.set("n", "<A-q>", function()
    print "TODO <A-q>"
end, {});
vim.keymap.set("n", "<A-e>", function()
    print "TODO <A-e>"
end, {});

-- use left/right/both/none
vim.keymap.set("n", "<A-a>", function()
    print "TODO <A-a>"
end, {});
vim.keymap.set("n", "<A-d>", function()
    print "TODO <A-d>"
end, {});
vim.keymap.set("n", "<A-w>", function()
    print "TODO <A-w>"
end, {});
vim.keymap.set("n", "<A-s>", function()
    print "TODO <A-s>"
end, {});

vim.api.nvim_set_keymap("n", ",do", ":diffoff<CR>", { noremap = true, silent = true });
vim.api.nvim_set_keymap("n", ",dt", ":diffthis<CR>", { noremap = true, silent = true });
-- }}}


-- ------- }}}
-- Options {{{

local options = {
    tabstop = 4,                -- tab width
    shiftwidth = 0,             -- indent width for >>, <<, etc. (0=tabstop)
    softtabstop = -1,           -- soft tab width (negative=shiftwidth)
    expandtab = true,           -- use spaces for indenting
    autoindent = true,          -- copy indent from current line when starting a new line
    smartindent = true,         -- make indent smarter
    copyindent = true,          -- copy the previous indentation on auto-indenting
    colorcolumn = "+0",         -- line at column 80
    textwidth = 88,             -- for line wrapping with `gq`

    wrap = false,               -- do not wrap long lines
    sidescroll = 1,             -- scroll long lines by 1 char
    sidescrolloff = 10,         -- horizontal scroll context
    scrolloff = 2,              -- vertical scroll context
    virtualedit = block,        -- cursor can be positioned anywhere in V-Block mode

    number = true,              -- show line number
    cursorline = false,         -- don't highlight cursor line
    cursorcolumn = false,       -- don't highlight cursor column
    relativenumber = true,      -- use relative line numbers (relative to the current)
    signcolumn = "yes",         -- always display line gutter (to prevent screen jumping on linter errors

    hlsearch = true,            -- highlight all search matches
    incsearch = true,           -- show found patters during typing
    ignorecase = true,          -- ignore case when searching
    smartcase = true,           -- ignore case if pattern is all lowercase
    wrapscan = true,            -- searching wraps around the end of the file

    history = 50,               -- keep 50 lines of command line history
    synmaxcol = 200,            -- maximum column in which to search for syntax items

    foldcolumn = "0",           -- display gutter line with folding areas
    foldmethod = "indent",      -- automatically fold by indent level
    foldlevelstart = 99,        -- make all folds open by default

    modeline = true,            -- support modeline comments (like vim: tw=8 noet:)
    autoread = true,            -- reload file after it has been changed outside

    list = true,                -- show whitespaces
    listchars = "eol: ,tab:╶─,trail:·,extends:…,precedes:…,nbsp:•", -- ↙
    breakindent = true,         -- wrapped lines are indented
    breakindentopt = "min:20,shift:0,sbr",
    showbreak="… ",             -- display '… ' at the beginning of wrapped lines
    fillchars="fold: ",         -- use ' ' for trailing fold lines instead of more intrusive '-'

    -- format options
    -- t - auto-wrap text
    -- c - auto-wrap comments
    -- r - insert comment leader on <Enter>
    -- o - insert comment leader on 'o' or 'O'
    -- q - comments formatting with 'gq'
    -- a - auto-format paragraphs (disabled)
    -- n - recognize number lists
    -- l - don't break already long lines in insert mode
    -- 1 - don't break line after one-letter word
    -- j - smart comments joining
    formatoptions="tcroqnl1j",
    joinspaces = false,         -- do not insert 2 spaces after '.', '?', and '!' with a join command

    -- wildchar = "<Tab>",      -- <Tab> is default
    wildmenu = true,            -- show cmdline matches above cmdline in menu
    wildmode = "longest:full",
    wildignorecase = true,
    wildignore = {
        "*/node_modules/*",
        "*/.git/branches/*",
        "*/.git/objects/*",
        "*/.git/lfs/*",
        "*/.git/logs/*",
        "*/.git/refs/*",
        "*/.git/rr-cache/*",
        "*/.git/index",
    },

    clipboard = { 'unnamedplus' }, -- use "+ register by default

    showcmd = false,             -- TODO
    showmode = true,            -- TODO
    spell = true,
    mouse = "a",
    laststatus = 2,             -- TODO
    completeopt = { "menu", "menuone", "noselect" },

    termguicolors = true,
    background = "light",

    -- backspace
    -- conceallevel
    -- fileencoding
    -- pumheight
    -- fileencoding
    -- showtabline
    -- swapfile
    -- updatetime
    -- writebackup
    -- shell
    -- exrc
    -- winblend
    -- wildoptions
    -- pumblend
    -- iskeyword

    timeoutlen = 500,           -- time in milliseconds to wait for a mapped sequence to complete
    undofile = true,
    title = true,

    splitbelow = true,
    splitright = true,
}

-- {{{2
for k, v in pairs(options) do
  vim.opt[k] = v
end
-- }}}


-- ------- }}}
-- Autocmd {{{

vim.cmd [[autocmd BufRead ~/.config/nvim/*.lua setlocal keywordprg=:help]]
vim.cmd [[autocmd FileType vim setlocal keywordprg=:help]]


-- -------- }}}
-- Commands {{{

vim.api.nvim_create_user_command('Vimrc', 'edit ~/.config/nvim/init.lua', {})
vim.api.nvim_create_user_command('R', 'source ~/.config/nvim/init.lua', {})


-- ------- }}}
-- Plugins {{{

-- Bootstrap {{{
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- }}}

require("lazy").setup({
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "light",
                styles = {
                    keywords = { italic = false },
                }
            })

            vim.cmd [[colorscheme tokyonight]]
        end,
    },
    {
        "navarasu/onedark.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            local onedark = require("onedark")
            local c = require("onedark.palette").light

            onedark.setup({
                style = "light",
                highlights = {
                    NvimTreeNormal = { fg = c.fg, bg = c.bg0 },
                    NvimTreeEndOfBuffer = { fg = c.bg_d, bg = c.bg0 },
                    NvimTreeIndentMarker = { fg = c.grey }
                }
            })
            onedark.load()
        end,
    },
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
            vim.api.nvim_set_keymap("n", "<C-/>", "gcc", {})
            vim.api.nvim_set_keymap("v", "<C-/>", "gc",  {})

            vim.api.nvim_set_keymap("n", "<C-_>", "gcc", {})
            vim.api.nvim_set_keymap("v", "<C-_>", "gc",  {})
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = true,
    },
    {
        "chapko/vim-fugitive", -- fork with 4-pane mergetool
        config = function()
            vim.api.nvim_set_keymap("n", ",mt", ":Git mergetool -y<CR>", {
                silent = true,
                noremap = true,
            })
        end
    }, 
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            -- TODO disable %
            -- TODO short mode name
            -- TODO full path
            -- TODO shorter branch name
            options = {
                theme = "tokyonight",
                -- theme = "onedark"
                -- disabled_filetypes = { 'NvimTree' },
                globalstatus = false,
            },
            sections = {
                lualine_a = {
                    { 'mode', fmt = function(str) return str:sub(1,1) end },
                },
                lualine_b = {
                    'branch',
                    'diff',
                    -- 'diagnostics',
                },
                lualine_x = { 'diagnostics', 'encoding', 'fileformat', 'filetype' },
                lualine_y = {},
                lualine_z = { 'location' },
            },
            inactive_sections = {
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                        fmt = function (str)
                            local abs_path = vim.fn.expand('%:p')
                            local pattern = '^fugitive://.*%.git//'
                            if abs_path:find(pattern) then
                                return abs_path:gsub(pattern, "")
                            end
                            return str
                        end
                    },
                },
            },
        },
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            options = {
                mode = 'tabs',
                diagnostics = 'nvim_lsp',
                diagnostics_indicator = function(_, _, diagnostics_dict)
                    local s = ''
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or false)
                        if sym then
                            s = s .. ' ' .. n .. sym
                        end
                    end
                    return s
                end,
            }
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                -- open_on_setup = true, -- TODO: deprecated
                view = {
                    side = "left"
                },
                diagnostics = {
                    enable = true,
                },
                actions = {
                    open_file = {
                        quit_on_open = true,
                    },
                }
            })

            vim.api.nvim_set_keymap("n", ",t", ":NvimTreeToggle<CR>", {
                silent = true,
                noremap = true,
            })
            vim.api.nvim_set_keymap("n", ",r", ":NvimTreeFindFile<CR>", {
                silent = true,
                noremap = true,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            require('nvim-treesitter.configs').setup({
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
            local ignore_patterns = {
                "node_modules/",
                "%.git/branches/",
                "%.git/objects/",
                "%.git/lfs/",
                "%.git/logs/",
                "%.git/refs/",
                "%.git/rr%-cache/",
                "%.git/index$",
            }
            require('telescope').setup({
                pickers = {
                    find_files = {
                        file_ignore_patterns = ignore_patterns
                    }
                }
            })

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>jf', function ()
                builtin.find_files({
                    hidden = true
                })
            end, {})
            vim.keymap.set('n', '<leader>jg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>jh', builtin.help_tags, {})
        end,
    },
})


-- --- }}}
-- GUI {{{

if vim.g.neovide then
    vim.o.guifont = "FiraCode NF,Segoe UI Emoji:h14"
    vim.g.neovide_cursor_animation_length = 0.075
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_trail_size = 0.15
    vim.g.neovide_refresh_rate = 144
end

-- }}}

-- vim: foldmethod=marker foldlevel=1 nospell:
