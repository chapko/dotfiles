vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "i", "c" }, "jj", "<ESC>", { noremap = true })
vim.keymap.set({ "i", "c" }, "jk", "<ESC>", { noremap = true })
vim.keymap.set("n", ";", ":", { noremap = true })

vim.keymap.set("n", "<S-Space>", ";", { noremap = true })
vim.keymap.set("n", "<C-Space>", ",", { noremap = true })

vim.keymap.set("n", "Y", "yy", { noremap = true })

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

    showcmd = true,             -- TODO
    showmode = true,            -- TODO
    spell = false, -- true,
    mouse = "a",
    laststatus = 2,             -- TODO
    completeopt = { "menu", "menuone", "noselect" },

    termguicolors = true,

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

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[autocmd BufRead ~/.config/nvim/*.lua setlocal keywordprg=:help]]
vim.cmd [[autocmd FileType vim setlocal keywordprg=:help]]

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

require("lazy").setup({
    "tpope/vim-surround",
    "tpope/vim-repeat",
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.opt.background = "light"
            vim.cmd [[colorscheme tokyonight-day]]
        end,
    },
})

if vim.g.neovide then
    vim.o.guifont = "FiraCode NF,Segoe UI Emoji:h14"
    vim.g.neovide_cursor_animation_length = 0.075
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_trail_size = 0.15
    vim.g.neovide_refresh_rate = 144
end
