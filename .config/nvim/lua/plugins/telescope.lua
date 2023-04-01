return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        enabled = function ()
            require('config.keymaps').plugins.telescope()
            return true
        end,
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
                    },
                    live_grep = {
                        file_ignore_patterns = ignore_patterns
                    }
                }
            })
        end,
    },
}
