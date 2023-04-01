local editing_events = { "BufReadPost", "BufNewFile" }

return {
    {
        "tpope/vim-surround",
        event = editing_events,
    },
    {
        "tpope/vim-repeat",
        event = editing_events,
    },
    {
        "windwp/nvim-autopairs",
        event = editing_events,
        config = true,
    },
    {
        "numToStr/Comment.nvim",
        event = editing_events,
        enabled = function (x)
            require("config.keymaps").plugins.Comment();
            return true;
        end,
        config = true,
    },
}
