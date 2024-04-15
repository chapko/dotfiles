-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "catppuccin",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      ["catppuccin-latte"] = function()
        local c = require("catppuccin.palettes").get_palette "latte"

        return {
          Folded = { fg = c.overlay0, bg = c.crust },
          Whitespace = { fg = c.surface0 },
          ColorColumn = { bg = c.mantle },
          UfoFoldedEllipsis = { bg = c.surface0, fg = c.subtext0 },
          IblIndent = { fg = c.mantle },
          IblScope = { fg = c.surface0 },
        }
      end,
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },

    status = {
      attributes = {
        -- disable italic
        buffer_active = { bold = true, italic = false },
      },
      separators = {
        path = "  ",
      },
    },
  },
}
