local editing_events = { "BufReadPost", "BufNewFile" }

---@type LazySpec
return {
  -- disabled
  { "max397574/better-escape.nvim", enabled = false }, -- breaks macros replay
  { "stevearc/aerial.nvim", enabled = false },
  { "goolord/alpha-nvim", enabled = false },
  { "L3MON4D3/LuaSnip", enabled = false },

  --

  { "laytan/cloak.nvim", lazy = false, config = true },
  { "tpope/vim-surround", event = editing_events },
  { "tpope/vim-repeat", event = editing_events },
  { "tpope/vim-fugitive", event = "BufEnter" },

  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = ":call mkdp#util#install()",
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  {
    "marilari88/twoslash-queries.nvim",
    ft = { "typescript", "typescriptreact" },
    cmd = { "EnableTwoslashQueries", "InspectTwoslashQueries" },
    config = true,
    opts = {
      is_enabled = false,
      highlight = "Comment",
    },
  },

  {
    "akinsho/toggleterm.nvim",
    opts = {
      highlights = {
        NormalFloat = { link = "Normal" },
      },
      shade_terminals = false,
    },
  },

  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    ft = { "neo-tree" },
    config = true,
  },

  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/user/snippets" } } -- load snippets paths
  --
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     -- local luasnip = require "luasnip"
  --     -- luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },

  {
    "folke/which-key.nvim",
    opts = {
      plugins = {
        registers = false,
      },
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "fade",
      fps = 60,
      timeout = 3000,
      max_width = 44,
      top_down = true,
    },
  },

  {
    "s1n7ax/nvim-window-picker",
    opts = {
      hint = "floating-big-letter",
      picker_config = {},
    },
  },

  -- == Examples of Overriding Plugins ==

  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
}
