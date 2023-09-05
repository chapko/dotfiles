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
      },
      -- filter = function(cl)
      --   vim.print(vim.bo.filetype .. ": " .. cl.name)
      --   return true
      -- end,
    },
    on_attach = function(client, bufnr)
      if client.name == "tsserver" then require("twoslash-queries").attach(client, bufnr) end
    end,
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
