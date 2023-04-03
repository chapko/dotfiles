return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
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
                    'branch', -- TODO shorter branch name
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
        event = "TabNew",
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
                always_show_bufferline = false
            }
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        enabled = function ()
            require('config.keymaps').plugins.nvim_tree()
            return true
        end,
        cmd = {
            'NvimTreeToggle',
            'NvimTreeFindFile',
        },
        opts = {
            respect_buf_cwd = true,
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
        }
    },
}
