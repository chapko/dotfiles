-- make K shortcut open vim help
vim.api.nvim_create_autocmd("BufRead", {
    pattern = vim.fn.expand("$HOME") .. "/.config/nvim/*",
    callback = function()
        vim.api.nvim_set_option_value("keywordprg", ":vertical rightbelow help", {
            scope = "local",
        })
    end
})
