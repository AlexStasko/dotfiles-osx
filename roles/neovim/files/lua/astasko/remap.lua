vim.g.mapleader = " "

-- Work with windows
-- Create a new window
vim.keymap.set('n', '<leader>n', ':wincmd n<CR>')
-- Switch between windows
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>')
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>')
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>')
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>')
-- Move window
vim.keymap.set('n', '<leader>H', ':wincmd H<CR>')
vim.keymap.set('n', '<leader>J', ':wincmd J<CR>')
vim.keymap.set('n', '<leader>K', ':wincmd K<CR>')
vim.keymap.set('n', '<leader>L', ':wincmd L<CR>')

-- Move visually selected line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Clear highlight on search on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
