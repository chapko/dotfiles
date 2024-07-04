-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function(_, config)
    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    config.sources = {
      require "none-ls.diagnostics.eslint_d",
      require "none-ls.formatting.eslint_d",
    }

    config.should_attach = function(buf)
      local file_name = vim.api.nvim_buf_get_name(buf)
      return string.find(file_name, "node_modules") == nil
    end

    return config -- return final config table
  end,
}
