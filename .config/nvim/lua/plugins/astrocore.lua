---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { -- diagnostic settings on startup
        virtual_text = true,
        virtual_lines = false,
      },
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true,
        number = true,
        signcolumn = "yes",
        wrap = false,

        textwidth = 88, -- for line wrapping with `gq`
        scrolloff = 3,
        sidescrolloff = 6,
        colorcolumn = "+0", -- line at 'textwidth' column
        list = true, -- display whitespace characters
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
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
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
          function() require("snacks").picker.highlights() end,
          desc = "Find highlights",
        },

        [",d"] = { name = "Diff" },
        [",do"] = { "<Cmd>diffoff<cr>", desc = ":diffoff" },
        [",dt"] = { "<Cmd>diffthis<cr>", desc = ":diffthis" },
        --
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

        ["<leader>uW"] = {
          function()
            local msg
            if vim.o.diffopt:match "iwhite" then
              vim.o.diffopt = vim.o.diffopt:gsub("iwhite", "")
              msg = "off"
            else
              vim.o.diffopt = vim.o.diffopt .. ",iwhite"
              msg = "on"
            end
            require("snacks").notifier.notify("whitespace diff " .. msg)
          end,
          desc = "Toggle whitespace diff",
        },
      },
      v = {
        [",p"] = { '"0p' },
      },
      i = {
        ["jj"] = { "<Esc>" },
        ["<C-J>"] = {
          function() vim.lsp.buf.signature_help() end,
          desc = "Signature help",
        },
      },
    },
    sessions = {
      autosave = {
        last = true,
        cwd = true,
      },
    },
  },
}
