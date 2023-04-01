require('config.options')
require('config.keymaps')
require('config.autocmds')
require('config.commands')

-- vim.cmd([[colorscheme tokyonight]])

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
    spec = {
        { import = "plugins" },
    },
    install = { colorscheme = { "tokyonight" } },
    defaults = { lazy = true },
});


if vim.g.neovide then
    vim.o.guifont = "FiraCode NF,Segoe UI Emoji:h14"
    vim.g.neovide_cursor_animation_length = 0.075
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_trail_size = 0.15
    vim.g.neovide_refresh_rate = 144
end
