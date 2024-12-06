-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap

        textwidth = 88, -- for line wrapping with `gq`
        scrolloff = 3,
        sidescrolloff = 6,
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

        spell = true,
        spelllang = "en_us",
        spelloptions = "camel",
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        ["Y"] = { "yy" },
        [";"] = { ":" },
        [",p"] = { '"0p' },
        ["<C-w><C-p>"] = { "<Cmd>pclose<cr>", desc = "Close preview" },

        ["<Leader>fH"] = {
          function() require("telescope.builtin").highlights() end,
          desc = "Find highlights",
        },

        ["M-`"] = '<Cmd>execute v:count . "ToggleTerm"<CR>',

        [",d"] = { name = "Diff" },
        [",do"] = { "<Cmd>diffoff<cr>", desc = ":diffoff" },
        [",dt"] = { "<Cmd>diffthis<cr>", desc = ":diffthis" },

        -- fugitive
        [",g"] = { name = "󰊢 Fugitive" },
        [",gs"] = { "<Cmd>Git<cr>", desc = "Status" },
        [",gb"] = { "<Cmd>Git blame<cr>", desc = "Blame" },
        [",gd"] = { "<Cmd>vertical Gdiffsplit<cr>", desc = "Diff" },
        [",gl"] = { "<Cmd>Git log --oneline<cr>", desc = "Log" },
        [",gm"] = { "<Cmd>Git mergetool -y<cr>", desc = "Run mergetool" },
        [",gw"] = { "<Cmd>Git blame<cr>", desc = "Toggle blame" },

        -- TODO: figure out plugin mappings (use mapping only if plugin is available)
        ["<leader>u."] = { "<Cmd>CloakToggle<cr>", desc = "Toggle cloaking" },
        ["<leader>."] = { "<Cmd>CloakPreviewLine<cr>", desc = "Preview cloaked line" },
      },
      i = {
        ["jj"] = { "<Esc>" },
        ["<C-J>"] = {
          function() vim.lsp.buf.signature_help() end,
          desc = "Signature help",
        },
      },
      t = {
        ["M-`"] = '<Cmd>execute v:count . "ToggleTerm"<CR>',
        ["<C-l>"] = false,
      },
    },
  },
}
