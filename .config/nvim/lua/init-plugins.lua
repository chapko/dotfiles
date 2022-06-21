require('nvim-tree').setup {
    view = {
        side = 'left',
    },
    diagnostics = {
        enable = true,
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
}


require('nvim_comment').setup()

require('lualine').setup {
    options = { theme = 'iceberg' }
}

require('bufferline').setup {
    options = {
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
        offsets = {
            {
                filetype = 'NvimTree',
            },
        },
    },
}

require('telescope').setup {
    pickers = {
        find_files = {
            theme = 'dropdown',
        },
    },
}

vim.g.terminal_color_0 = '#657b83'
require('toggleterm').setup {
    open_mapping = [[<a-`>]],
    shade_terminals = false,
}

