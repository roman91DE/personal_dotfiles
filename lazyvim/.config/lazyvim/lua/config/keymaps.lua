-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }
-- control + c to escape in insert mode
vim.keymap.set({ "i", "v", "s" }, "<C-c>", "<Esc>", opts)
-- _ behaves likes ^ in both normal and visual mode
vim.keymap.set({ "n", "v" }, "_", "^", opts)

-- terminal mode keymaps
--  map <Esc> to exit terminal-mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)

-- Window Navigation using Alt + h/j/k/l for all modes
-- Terminal mode
vim.api.nvim_set_keymap("t", "<A-h>", [[<C-\><C-N><C-w>h]], opts)
vim.api.nvim_set_keymap("t", "<A-j>", [[<C-\><C-N><C-w>j]], opts)
vim.api.nvim_set_keymap("t", "<A-k>", [[<C-\><C-N><C-w>k]], opts)
vim.api.nvim_set_keymap("t", "<A-l>", [[<C-\><C-N><C-w>l]], opts)
-- Insert mode
vim.api.nvim_set_keymap("i", "<A-h>", [[<C-\><C-N><C-w>h]], opts)
vim.api.nvim_set_keymap("i", "<A-j>", [[<C-\><C-N><C-w>j]], opts)
vim.api.nvim_set_keymap("i", "<A-k>", [[<C-\><C-N><C-w>k]], opts)
vim.api.nvim_set_keymap("i", "<A-l>", [[<C-\><C-N><C-w>l]], opts)
-- Normal mode
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<A-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<A-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>l", opts)
