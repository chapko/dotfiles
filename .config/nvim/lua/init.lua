require('init-plugins');
require('init-lsp')

vim.diagnostic.config {
    virtual_text = {
        spacing = 4,
    },
    float = {
        scope = 'line',
    },
}

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true })
