-- Config for AstroNvim v4.7.0

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
        "cssls",
        "tailwindcss",
        "terraformls",
      },
      -- filter = function(cl)
      --   vim.print(vim.bo.filetype .. ": " .. cl.name)
      --   return true
      -- end,
    },
    on_attach = function(client, bufnr)
      if client.name == "tsserver" then require("twoslash-queries").attach(client, bufnr) end
    end,
    config = {
      tsserver = function(opts)
        local has_config = require("lspconfig.util").root_pattern("tsconfig.json", "jsconfig.json", "package.json")
        local has_git = require("lspconfig.util").root_pattern ".git"
        opts.root_dir = function(fname) return has_git(fname) or has_config(fname) end
        return opts
      end,
    },
  },

  highlights = {
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

  options = {
    g = {
      resession_enabled = true,
    },
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

    n["<leader>fH"] = {
      function() require("telescope.builtin").highlights() end,
      desc = "Find highlights",
    }

    -- terminal
    n["<M-`>"] = n["<F7>"]
    t["<M-`>"] = t["<F7>"]
    t["<C-l>"] = nil

    n[",d"] = { name = "Diff" }
    n[",do"] = { "<cmd>diffoff<cr>", desc = ":diffoff" }
    n[",dt"] = { "<cmd>diffthis<cr>", desc = ":diffthis" }

    -- fugitive
    n[",g"] = { name = "󰊢 Fugitive" }
    n[",gs"] = { "<cmd>Git<cr>", desc = "Status" }
    n[",gb"] = { "<cmd>Git blame<cr>", desc = "Blame" }
    n[",gd"] = { "<cmd>vertical Gdiffsplit<cr>", desc = "Diff" }
    n[",gl"] = { "<cmd>Git log --oneline<cr>", desc = "Log" }
    n[",gm"] = { "<cmd>Git mergetool -y<cr>", desc = "Run mergetool" }
    n[",gw"] = { "<cmd>Git blame<cr>", desc = "Toggle blame" }

    -- toggle cloaking
    if require("astronvim.utils").is_available "cloak.nvim" then
      n["<leader>u."] = { "<cmd>CloakToggle<cr>", desc = "Toggle cloaking" }
    end

    i["<C-J>"] = {
      function() vim.lsp.buf.signature_help() end,
      desc = "Signature help",
    }

    return mapping
  end,

  heirline = {
    attributes = {
      -- disable italic
      buffer_active = { bold = true, italic = false },
    },
    separators = {
      path = "  ",
    },
  },

  polish = function()
    --- @diagnostic disable-next-line: undefined-field
    if vim.g.neovide then
      vim.o.guifont = "FiraCode NF,Segoe UI Emoji:h14"
      vim.g.neovide_cursor_animation_length = 0.075
      vim.g.neovide_cursor_antialiasing = true
      vim.g.neovide_cursor_trail_size = 0.15
      vim.g.neovide_refresh_rate = 144
    end

    if require("astronvim.utils").is_available "resession.nvim" then
      vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("resession_load_on_start", { clear = true }),
        callback = function()
          -- Only load the session if nvim was started with no args
          if vim.fn.argc(-1) ~= 0 then return end

          -- wait for other plugins (cloak, color-highlight, etc.) to initialize
          vim.schedule(
            function()
              require("resession").load(vim.fn.getcwd(), {
                dir = "dirsession",
                silence_errors = true,
              })
            end
          )
        end,
      })
    end
  end,
}
