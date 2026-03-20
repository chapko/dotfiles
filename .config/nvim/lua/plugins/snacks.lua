return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  ---@type snacks.Config
  opts = {
    scroll = { enabled = false },
    dashboard = {
      preset = {
        header = "🍉",
      },
      sections = {
        { section = "header" },
        { title = "Recent", section = "recent_files", padding = 1 },
        { title = "Projects", section = "projects", padding = 1 },
        { section = "startup" },
      },
    },
  },
}
