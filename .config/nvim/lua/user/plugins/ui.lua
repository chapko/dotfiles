return {

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      default_component_configs = {
        indent = { padding = 0, indent_size = 2 },
      },
      window = {
        width = 40,
      },
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
}
