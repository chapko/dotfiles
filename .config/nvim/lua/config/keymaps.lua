vim.keymap.set({ "i", "c" }, "jj", "<ESC>", { noremap = true })
vim.keymap.set({ "i", "c" }, "jk", "<ESC>", { noremap = true })

vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", "Y", "yy", { noremap = true })
vim.keymap.set("n", ",n", "<Cmd>nohlsearch<CR>", { noremap = true })
vim.keymap.set("n", ",w", "<Cmd>setlocal wrap!<CR>", { noremap = true })

vim.keymap.set("n", "<S-Space>", ";", { noremap = true })
vim.keymap.set("n", "<C-Space>", ",", { noremap = true })

-- very magic (:h \v)
vim.keymap.set("n", "<A-/>", "/\\v", { noremap = true })

-- more natural navigation on wrapped lines
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

vim.keymap.set({ "i", "c" }, "<C-r><C-r>", "<C-r>+", { noremap = true })

-- windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<A-j>", "<Cmd>resize +5<CR>", { noremap = true })
vim.keymap.set("n", "<A-k>", "<Cmd>resize -5<CR>", { noremap = true })
vim.keymap.set("n", "<A-l>", "<Cmd>vertical resize +5<CR>", { noremap = true })
vim.keymap.set("n", "<A-h>", "<Cmd>vertical resize -5<CR>", { noremap = true })

vim.keymap.set("n", "<M-{>", "<Cmd>tabprevious<CR>", {  noremap = true })
vim.keymap.set("n", "<M-}>", "<Cmd>tabnext<CR>", { noremap = true })

-- diff side with base
vim.keymap.set("n", "<A-1>", function() print 'TODO <A-1>'; end, {});
vim.keymap.set("n", "<A-3>", function() print 'TODO <A-3>' end, {});

-- diff all
vim.keymap.set("n", "<A-2>", function() print "TODO <A-2>" end, {});

-- diff side with conflict
vim.keymap.set("n", "<A-q>", function() print "TODO <A-q>" end, {});
vim.keymap.set("n", "<A-e>", function() print "TODO <A-e>" end, {});

-- use left/right/both/none
vim.keymap.set("n", "<A-a>", function() print "TODO <A-a>" end, {});
vim.keymap.set("n", "<A-d>", function() print "TODO <A-d>" end, {});
vim.keymap.set("n", "<A-w>", function() print "TODO <A-w>" end, {});
vim.keymap.set("n", "<A-s>", function() print "TODO <A-s>" end, {});

vim.keymap.set("n", ",do", "<Cmd>diffoff<CR>", { noremap = true });
vim.keymap.set("n", ",dt", "<Cmd>diffthis<CR>", { noremap = true });

local M = {};

M.plugins = {
    Comment = function ()
        vim.api.nvim_set_keymap("n", "<C-/>", "gcc", {})
        vim.api.nvim_set_keymap("v", "<C-/>", "gc",  {})
        vim.api.nvim_set_keymap("n", "<C-_>", "gcc", {})
        vim.api.nvim_set_keymap("v", "<C-_>", "gc",  {})
    end,

    telescope = function ()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<space>jf', function ()
            builtin.find_files({ hidden = true })
        end, { noremap = true })

        vim.keymap.set('n', '<space>jg', function ()
            builtin.live_grep()
        end, { noremap = true })

        vim.keymap.set('n', '<space>jh', function ()
            builtin.help_tags()
        end, { noremap = true })
    end,

    nvim_tree = function ()
        vim.api.nvim_set_keymap("n", ",t", "<Cmd>NvimTreeToggle<CR>", { noremap = true })
        vim.api.nvim_set_keymap("n", ",r", "<Cmd>NvimTreeFindFile<CR>", { noremap = true })
    end,
}

return M
