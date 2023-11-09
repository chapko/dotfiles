local editing_events = { "BufReadPost", "BufNewFile" }

return {
  --
  { "laytan/cloak.nvim", lazy = false, config = true },
  { "tpope/vim-surround", event = editing_events },
  { "tpope/vim-repeat", event = editing_events },

  -- fork with 4-pane mergetool
  { "chapko/vim-fugitive", event = "BufEnter" },

  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = ":call mkdp#util#install()",
  },

  -- {
  --   "lewis6991/gitsigns.nvim",
  --   opts = {
  --     current_line_blame = true,
  --     current_line_blame_opts = {
  --       virt_text = true,
  --       virt_text_pos = "eol",
  --       delay = 2000,
  --       ignore_whitespace = false,
  --     },
  --     current_line_blame_formatter = "      <author>, <author_time:%Y-%m-%d> - <summary>",
  --   },
  -- },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = false,
      autotag = {
        enable = true,
        -- remove when https://github.com/windwp/nvim-ts-autotag/issues/125 closed.
        enable_close_on_slash = false,
      },
      highlight = {
        disable = function(_, buf)
          local file_name = vim.api.nvim_buf_get_name(buf)

          if string.find(file_name, "node_modules") ~= nil then return true end

          local max_filesize = 50 * 1024 -- 50 KB
          local ok, stats = pcall(vim.loop.fs_stat, file_name)
          if ok and stats and stats.size > max_filesize then return true end
        end,
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = {
      should_attach = function(buf)
        local file_name = vim.api.nvim_buf_get_name(buf)
        return string.find(file_name, "node_modules") == nil
      end,
    },
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"

      table.insert(opts.sources, {
        name = "emmet_vim",
        priority = 1500,
        group_index = 1,
      })

      return vim.tbl_deep_extend("force", opts, {
        mapping = {
          ["<Tab>"] = cmp.mapping.confirm { select = true },
          ["<C-n>"] = cmp.mapping(function(fallback)
            local call_fallback = false
            if cmp.visible() then
              cmp.select_next_item()
            else
              call_fallback = not cmp.complete()
            end
            if call_fallback then fallback() end
          end, { "i", "c" }),
          ["<C-p>"] = cmp.mapping(function(fallback)
            local call_fallback = false
            if cmp.visible() then
              cmp.select_prev_item()
            else
              call_fallback = not cmp.complete()
            end
            if call_fallback then fallback() end
          end, { "i", "c" }),
          ["<C-e>"] = nil,
          ["<C-j>"] = nil,
          ["<C-k>"] = nil,
        },
      })
    end,
  },

  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    enabled = true,
    config = function()
      vim.g.codeium_disable_bindings = true
      vim.keymap.set("i", "<C-e>", function() return vim.fn["codeium#Accept"]() end, {
        expr = true,
        silent = true,
        desc = "Codeium Accept",
      })
      vim.keymap.set("i", "<M-]>", function() return vim.fn["codeium#CycleCompletions"](1) end, {
        expr = true,
        silent = true,
        desc = "Codeium Next",
      })
      vim.keymap.set("i", "<M-[>", function() return vim.fn["codeium#CycleCompletions"](-1) end, {
        expr = true,
        silent = true,
        desc = "Codeium Previous",
      })
      vim.keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, {
        expr = true,
        silent = true,
        desc = "Codeium Clear",
      })
    end,
  },

  {
    "mattn/emmet-vim",
    ft = { "html", "xml", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
  },

  {
    "dcampos/cmp-emmet-vim",
    ft = { "html", "xml", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
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
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/user/snippets" } } -- load snippets paths
    end,
  },
}
