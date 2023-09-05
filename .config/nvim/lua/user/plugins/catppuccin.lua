return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    opts = {
      flavour = "latte",
      no_italic = true,
      term_colors = true,
      integrations = {
        aerial = true,
        gitsigns = true,
        mason = true,
        neotree = true,
        native_lsp = { enabled = true },
        notify = true,
        treesitter = true,
        telescope = true,
        dap = { enabled = true, enable_ui = true },
      },
      color_overrides = {
          -- stylua: ignore
          latte = {
            rosewater = '#b4462d', -- '#dc8a78',
            flamingo  = '#b54a4a', -- '#dd7878',
            pink      = '#b34295', -- '#ea76cb',
            mauve     = '#824dc7', -- '#8839ef',
            red       = '#b00c0c', -- '#d20f39',
            maroon    = '#6d2228', -- '#e64553',
            peach     = '#a66611', -- '#fe640b',
            yellow    = '#a36d00', -- '#df8e1d',
            green     = '#478a38', -- '#40a02b',
            teal      = '#3e7174', -- '#179299',
            sky       = '#1c7497', -- '#04a5e5',
            sapphire  = '#367681', -- '#209fb5',
            blue      = '#3c64b4', -- '#1e66f5',
            lavender  = '#5466c9', -- '#7287fd',
            text      = '#676b8e', -- '#4c4f69',
            subtext1  = '#686c87', -- '#5c5f77',
            subtext0  = '#6c6f85', -- '#6c6f85',
            overlay2  = '#7c7f93', -- '#7c7f93',
            overlay1  = '#8c8fa1', -- '#8c8fa1',
            overlay0  = '#9ca0b0', -- '#9ca0b0',
            surface2  = '#acb0be', -- '#acb0be',
            surface1  = '#bcc0cc', -- '#bcc0cc',
            surface0  = '#ccd0da', -- '#ccd0da',
            base      = '#eff1f5', -- '#eff1f5',
            mantle    = '#e6e9ef', -- '#e6e9ef',
            crust     = '#dce0e8', -- '#dce0e8',
          },
      },
      custom_highlights = function(c)
        return {
          Folded = {
            fg = c.overlay0,
            bg = c.crust,
          },
          Whitespace = {
            fg = c.crust,
          },
          Colorcolumn = {
            bg = c.crust,
          },
        }
      end,
    },
  },
}
