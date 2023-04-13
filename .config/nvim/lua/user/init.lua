-- Config for AstroNvim v4.7.0

local editing_events = { "BufReadPost", "BufNewFile" }

return {
  colorscheme = "catppuccin",
  plugins = {
    {
      "laytan/cloak.nvim",
      event = editing_events,
      config = true,
    },
    {
      "tpope/vim-surround",
      event = editing_events,
    },
    {
      "tpope/vim-repeat",
      event = editing_events,
    },
    {
      "chapko/vim-fugitive", -- fork with 4-pane mergetool
      event = "BufEnter",
    },
    {
      "iamcco/markdown-preview.nvim",
      cmd = "MarkdownPreview",
      build = ":call mkdp#util#install()",
    },
    -- {
    --   "toppair/peek.nvim",
    --   build = "deno task --quiet build:fast",
    --   cmd = "Peek",
    --   opts = function()
    --     return {
    --       app = { "cmd.exe", "/c", "start" },
    --     }
    --   end,
    --   config = function(_, opts)
    --     require("peek").setup(opts)
    --
    --     vim.api.nvim_create_user_command("Peek", require("peek").open, {})
    --     vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    --   end,
    -- },
    {
      "catppuccin/nvim",
      lazy = false,
      priority = 1000,
      name = "catppuccin",
      opts = {
        flavour = "latte",
        no_italic = not vim.g.neovide,
        term_colors = true,
        integrations = {
          aerial = true,
          gitsigns = true,
          mason = true,
          neotree = true,
          native_lsp = {
            enabled = true,
          },
          notify = true,
          treesitter = true,
          telescope = true,
          dap = {
            enabled = true,
            enable_ui = true,
          },
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
            -- alpha logo
            DashboardHeader = {
              fg = c.overlay0,
              style = { "bold" },
            },
            Folded = {
              fg = c.overlay0,
              bg = c.crust,
            },
          }
        end,
      },
    },
    {
      "folke/tokyonight.nvim",
      lazy = true,
      opts = {
        style = "light",
        styles = {
          keywords = { italic = false },
          comments = { italic = vim.g.neovide or false },
        },
        on_highlights = function(hl, c)
          hl.DashboardHeader = {
            fg = c.red1,
          }
          hl.NeotreeTabActive = {
            fg = c.text,
            bg = c.bg_dark,
            bold = true,
          }
          hl.NeoTreeTabSeparatorActive = {
            fg = c.bg_dark,
            bg = c.bg_dark,
          }
          hl.NeotreeTabInactive = {
            fg = c.comment,
            bg = c.bg,
          }
          hl.NeoTreeTabSeparatorInactive = {
            fg = c.bg_dark,
            bg = c.bg,
          }
        end,
      },
    },
    {
      "goolord/alpha-nvim",
      opts = function(_, opts)
        opts.section.header.val = {
          [[  \    /  ]],
          [[          ]],
          [[──  🦀  ──]],
          [[          ]],
          [[  /    \  ]],
        }
      end,
    },
    {
      "nvim-telescope/telescope.nvim",
      opts = function(_, opts)
        local actions = require "telescope.actions"
        local i = opts.defaults.mappings.i
        i["<C-j>"] = actions.cycle_history_next
        i["<C-k>"] = actions.cycle_history_prev
        i["<C-n>"] = actions.move_selection_next
        i["<C-p>"] = actions.move_selection_previous
      end,
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        filesystem = {
          filtered_items = {
            visible = true,
            never_show_by_pattern = {
              "*/.git/branches",
              "*/.git/objects",
              "*/.git/lfs",
              "*/.git/logs",
              "*/.git/refs",
              "*/.git/rr-cache",
              "*/.git/index",
            },
          },
          window = {
            mappings = {
              ["/"] = "noop",
            },
          },
        },
      },
    },
    {
      "nvim-telescope/telescope.nvim",
      opts = function(_, opts)
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
        return vim.tbl_extend("force", opts, {
          pickers = {
            find_files = {
              file_ignore_patterns = ignore_patterns,
            },
            live_grep = {
              file_ignore_patterns = ignore_patterns,
            },
          },
        })
        -- opts.pickers.find_files.file_ignore_patterns = ignore_patterns
        -- opts.pickers.live_grep.file_ignore_patterns = ignore_patterns
      end,
    },
  },
  options = {
    opt = {
      textwidth = 88,     -- for line wrapping with `gq`
      colorcolumn = "+0", -- line at column 80
      list = true,        -- display whitespace characters
      listchars = {
        eol = " ",
        tab = "╶─",
        trail = "·",
        extends = "…",
        precedes = "…",
        nbsp = "•", -- ↙
      },
    },
  },
  mappings = function(mapping)
    local n = mapping.n
    local t = mapping.t

    n["Y"] = { "yy" }
    n[";"] = { ":" }

    n["<C-w><C-p>"] = { "<cmd>pclose<cr>", desc = "Close preview" }

    n["<leader>gw"] = {
      "<cmd>Git blame<cr>",
      desc = "Toggle blame",
    }

    -- terminal
    n["<M-`>"] = n["<F7>"]
    t["<M-`>"] = n["<F7>"]
    t["<C-l>"] = nil

    -- fugitive
    n[",g"] = { name = " Fugitive" }
    n[",gb"] = { "<cmd>Git blame<cr>", desc = "Blame" }
    n[",gd"] = { "<cmd>vertical Gdiffsplit<cr>", desc = "Diff" }
    n[",gl"] = { "<cmd>Git log --oneline<cr>", desc = "Log" }
    n[",gm"] = {
      "<cmd>Git mergetool -y<cr>",
      desc = "Run mergetool",
    }

    return mapping
  end,
  polish = function()
    vim.api.nvim_create_user_command("Vimrc", "edit ~/.config/nvim/lua/user/init.lua", {})

    --- @diagnostic disable-next-line: undefined-field
    if vim.g.neovide then
      vim.o.guifont = "FiraCode NF,Segoe UI Emoji:h14"
      vim.g.neovide_cursor_animation_length = 0.075
      vim.g.neovide_cursor_antialiasing = true
      vim.g.neovide_cursor_trail_size = 0.15
      vim.g.neovide_refresh_rate = 144
    end
  end,
}
