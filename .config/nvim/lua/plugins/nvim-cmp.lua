if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"

    -- table.insert(opts.sources, {
    --   name = "emmet_vim",
    --   priority = 1500,
    --   group_index = 1,
    -- })

    return vim.tbl_deep_extend("force", opts, {
      mapping = {
        ["<Tab>"] = cmp.mapping.confirm { select = true },
        ["<C-n>"] = cmp.mapping(function(fallback)
          local call_fallback = false
          if cmp.visible() then
            cmp.select_next_item()
          else
            call_fallback = not cmp.complete()
          end
          if call_fallback then fallback() end
        end, { "i", "c" }),
        ["<C-p>"] = cmp.mapping(function(fallback)
          local call_fallback = false
          if cmp.visible() then
            cmp.select_prev_item()
          else
            call_fallback = not cmp.complete()
          end
          if call_fallback then fallback() end
        end, { "i", "c" }),
        ["<C-e>"] = nil,
        ["<C-j>"] = nil,
        ["<C-k>"] = nil,
      },
    })
  end,
}
