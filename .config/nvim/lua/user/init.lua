-- Config for AstroNvim v4.7.0

local editing_events = { "BufReadPost", "BufNewFile" }

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

return {
  colorscheme = "catppuccin",
  lsp = {
    formatting = {
      format_on_save = true,
      disabled = {
        "html",
        "jsonls",
        "tsserver",
        "cssmodules_ls",
        "lua_ls",
      },
      filter = function(cl)
        vim.print(vim.bo.filetype .. ": " .. cl.name)
        return true
      end,
    },
  },
  plugins = {
    {
      -- breaks macros replay
      "max397574/better-escape.nvim",
      enabled = false,
    },
    { "laytan/cloak.nvim", event = editing_events, config = true },
    { "tpope/vim-surround", event = editing_events },
    { "tpope/vim-repeat", event = editing_events },
    -- fork with 4-pane mergetool
    { "chapko/vim-fugitive", event = "BufEnter" },
    {
      "iamcco/markdown-preview.nvim",
      ft = "markdown",
      build = ":call mkdp#util#install()",
    },
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
    {
      "folke/tokyonight.nvim",
      lazy = true,
      enabled = false,
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
      opts = {
        defaults = {
          preview = {
            treesitter = false,
          },
        },
        pickers = {
          find_files = {
            file_ignore_patterns = ignore_patterns,
          },
          live_grep = {
            file_ignore_patterns = ignore_patterns,
          },
        },
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        auto_install = true,
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
      "folke/which-key.nvim",
      opts = {
        plugins = {
          registers = false,
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
            ["<C-j>"] = cmp.mapping(function(fallback)
              local call_fallback = false
              if cmp.visible() then
                cmp.select_prev_item()
              else
                call_fallback = not cmp.complete()
              end
              if call_fallback then fallback() end
            end, { "i", "c" }),
            ["<C-e>"] = nil,
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
      "rcarriga/nvim-notify",
      opts = {
        stages = "fade",
        fps = 60,
        timeout = 3000,
        max_width = 44,
      },
    },
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local status = require "astronvim.utils.status"
        opts.statusline[3] = status.component.file_info {
          filetype = false,
          filename = { modify = ":p" },
        }
        return opts
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
  },
  options = {
    opt = {
      textwidth = 88, -- for line wrapping with `gq`
      colorcolumn = "+0", -- line at 'textwidth' column
      list = true, -- display whitespace characters
      clipboard = "unnamedplus",
      completeopt = { "menu", "menuone", "noinsert" },
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
    local i = mapping.i
    local t = mapping.t

    i["jj"] = { "<esc>" }
    n["Y"] = { "yy" }
    n[";"] = { ":" }
    n[",p"] = { '"0p' }

    n["<C-w><C-p>"] = { "<cmd>pclose<cr>", desc = "Close preview" }

    n["<leader>gw"] = {
      "<cmd>Git blame<cr>",
      desc = "Toggle blame",
    }

    -- terminal
    local toggle_term_cmd = {
      function()
        local utils = require "astronvim.utils"
        local Path = require "plenary.path"
        local cwd = Path:new(vim.loop.cwd())
        local folder = cwd:make_relative(cwd:parents()[1])
        local session_name = "e:" .. folder
        utils.toggle_term_cmd("tmux attach -t '" .. session_name .. "' || tmux new-session -s '" .. session_name .. "'")
      end,
      desc = "Toggle terminal",
    }
    n["<M-`>"] = toggle_term_cmd
    t["<M-`>"] = toggle_term_cmd
    t["<C-l>"] = nil

    n[",d"] = { name = "Diff" }
    n[",do"] = { "<cmd>diffoff<cr>", desc = ":diffoff" }
    n[",dt"] = { "<cmd>diffthis<cr>", desc = ":diffthis" }

    -- fugitive
    n[",g"] = { name = " Fugitive" }
    n[",gs"] = { "<cmd>Git<cr>", desc = "Status" }
    n[",gb"] = { "<cmd>Git blame<cr>", desc = "Blame" }
    n[",gd"] = { "<cmd>vertical Gdiffsplit<cr>", desc = "Diff" }
    n[",gl"] = { "<cmd>Git log --oneline<cr>", desc = "Log" }
    n[",gm"] = { "<cmd>Git mergetool -y<cr>", desc = "Run mergetool" }

    i["<C-J>"] = {
      function() vim.lsp.buf.signature_help() end,
      desc = "Signature help",
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
