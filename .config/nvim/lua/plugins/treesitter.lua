-- Customize Treesitter

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.auto_install = true

      opts.highlight = {
        disable = function(_, buf)
          local file_name = vim.api.nvim_buf_get_name(buf)

          if string.find(file_name, "node_modules") ~= nil then return true end

          local max_filesize = 50 * 1024 -- 50 KB
          local ok, stats = pcall(vim.loop.fs_stat, file_name)
          if ok and stats and stats.size > max_filesize then return true end
        end,
      }

      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua",
        "vim",
        -- add more arguments for adding more treesitter parsers
      })
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    config = true,
  },
}
