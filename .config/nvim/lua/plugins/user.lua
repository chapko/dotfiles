local editing_events = { "BufReadPost", "BufNewFile" }

---@type LazySpec
return {
  -- disabled
  { "max397574/better-escape.nvim", enabled = false },
  { "L3MON4D3/LuaSnip", enabled = false },

  { "laytan/cloak.nvim", lazy = false, config = true },
  { "tpope/vim-surround", event = editing_events },
  { "tpope/vim-repeat", event = editing_events },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
    },
  },

  {
    "s1n7ax/nvim-window-picker",
    opts = {
      hint = "floating-big-letter",
      picker_config = {},
    },
  },

  {
    "stevearc/aerial.nvim",
    opts = {
      -- Available kinds:
      --
      -- Array Boolean Class Constant Constructor Enum EnumMember Event Field File
      -- Function Interface Key Method Module Namespace Null Number Object Operator
      -- Package Property String Struct TypeParameter Variable
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
      },
    },
  },
}
