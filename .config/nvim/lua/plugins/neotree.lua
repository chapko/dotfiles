return {
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
          ["o"] = "open",
          ["<m-o>"] = "system_open",

          ["/"] = "noop",
          ["oc"] = "noop",
          ["od"] = "noop",
          ["og"] = "noop",
          ["om"] = "noop",
          ["on"] = "noop",
          ["os"] = "noop",
          ["ot"] = "noop",

          ["O"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "O" } },
          ["Oc"] = "order_by_created",
          ["Od"] = "order_by_diagnostics",
          ["Og"] = "order_by_git_status",
          ["Om"] = "order_by_modified",
          ["On"] = "order_by_name",
          ["Os"] = "order_by_size",
          ["Ot"] = "order_by_type",

          ["F"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node.path
              if node.type == "file" then path = node:get_parent_id() end
              require("snacks").picker.grep { dirs = { path } }
            end,
            desc = "grep folder",
          },

          ["<C-j>"] = { "scroll_preview", config = { direction = -10 } },
          ["<C-k>"] = { "scroll_preview", config = { direction = 10 } },
        },
      },
    },
  },
}
