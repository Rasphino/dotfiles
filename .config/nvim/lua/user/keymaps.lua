-- shorten aliases
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap


-- ===== Leader Key =====
keymap('', "<Space>", "<cmd>call VSCodeNotify('whichkey.show')<cr>", opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ===== Window & Buffer Operations =====
-- fast navigation
-- keymap("n", "<C-n>", "<cmd>call VSCodeNotify('workbench.action.navigateLeft')<cr>", opts)
-- keymap("n", "<C-e>", "<cmd>call VSCodeNotify('workbench.action.navigateDown')<cr>", opts)
-- keymap("n", "<C-i>", "<cmd>call VSCodeNotify('workbench.action.navigateUp')<cr>", opts)
-- keymap("n", "<C-o>", "<cmd>call VSCodeNotify('workbench.action.navigateRight')<cr>", opts)

keymap("n", "<tab>", ":Tabnext<CR>", opts)
keymap("n", "<S-tab>", ":Tabprev<CR>", opts)

-- ===== Basic Mappings =====
keymap('', 'j', 'n', opts)
keymap('', 'J', 'N', opts)

-- easier command
keymap('', ';', ':', opts)

-- insert below/next line
keymap('', 'l', 'o', opts)
keymap('', 'L', 'O', opts)

-- insert key
keymap('', 'k', 'i', opts)
keymap('', 'K', 'I', opts)

-- find pair
keymap('', ',.', '%', opts)

-- cursor movement
keymap('', 'n', 'h', opts)
keymap('', 'e', 'j', opts)
keymap('', 'i', 'k', opts)
keymap('', 'o', 'l', opts)

-- to start and end
keymap('', 'N', '0', opts)
keymap('', 'O', '$', opts)
keymap('', 'h', 'e', opts)

-- move view port without moving cursor
-- keymap('', '<C-i>', '5<C-y>', opts)
-- keymap('', '<C-e>', '5<C-e>', opts)
-- 