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
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require "telescope.actions"

      return vim.tbl_deep_extend("force", opts, {
        defaults = {
          preview = {
            treesitter = false,
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.cycle_history_next,
              ["<C-k>"] = actions.cycle_history_prev,
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
            },
          },
        },
        pickers = {
          find_files = {
            file_ignore_patterns = ignore_patterns,
          },
          live_grep = {
            file_ignore_patterns = ignore_patterns,
          },
          colorscheme = {
            enable_preview = true,
          },
          buffers = {
            sort_mru = true,
          },
        },
      })
    end,
  },
}
