return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        },
        config = function (_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
    },
    {
        "chapko/vim-fugitive", -- fork with 4-pane mergetool
        event = "BufEnter",
        config = function()
            vim.api.nvim_set_keymap("n", ",mt", "<Cmd>Git mergetool -y<CR>", { noremap = true })
        end
    },
}
