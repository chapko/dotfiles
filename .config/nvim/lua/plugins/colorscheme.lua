return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "light",
            styles = {
                keywords = { italic = false },
            },
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd [[colorscheme tokyonight]]
        end,
    },
    {
        "navarasu/onedark.nvim",
        lazy = true,
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
            -- onedark.load()
        end,
    },
}
