return {
  "Exafunction/codeium.vim",
  event = "InsertEnter",
  enabled = true,
  config = function()
    vim.g.codeium_disable_bindings = true
    vim.keymap.set("i", "<C-e>", function() return vim.fn["codeium#Accept"]() end, {
      expr = true,
      silent = true,
      desc = "Codeium Accept",
    })
    vim.keymap.set("i", "<M-]>", function() return vim.fn["codeium#CycleCompletions"](1) end, {
      expr = true,
      silent = true,
      desc = "Codeium Next",
    })
    vim.keymap.set("i", "<M-[>", function() return vim.fn["codeium#CycleCompletions"](-1) end, {
      expr = true,
      silent = true,
      desc = "Codeium Previous",
    })
    vim.keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, {
      expr = true,
      silent = true,
      desc = "Codeium Clear",
    })
  end,
}
