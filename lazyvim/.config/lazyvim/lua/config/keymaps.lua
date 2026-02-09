-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- _ behaves likes ^ in both normal and visual mode
vim.keymap.set({ "n", "v" }, "_", "^", opts)

-- Esc changes to Normal Mode in Terminal Mode
-- C-c changes to Vim Normal Mode in Terminal Mode
--vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)
--vim.keymap.set("t", "<C-c>", "<Esc>", opts)

-- Ctrl-C to enter Normal Mode from Terminal Mode
vim.keymap.set("t", "<C-c>", "<C-\\><C-n>", opts)
--
-- Window Navigation using Alt + h/j/k/l for all modes
-- Terminal mode
vim.api.nvim_set_keymap("t", "<C-h>", [[<C-\><C-N><C-w>h]], opts)
vim.api.nvim_set_keymap("t", "<C-j>", [[<C-\><C-N><C-w>j]], opts)
vim.api.nvim_set_keymap("t", "<C-k>", [[<C-\><C-N><C-w>k]], opts)
vim.api.nvim_set_keymap("t", "<C-l>", [[<C-\><C-N><C-w>l]], opts)
-- Insert mode
vim.api.nvim_set_keymap("i", "<C-h>", [[<C-\><C-N><C-w>h]], opts)
vim.api.nvim_set_keymap("i", "<C-j>", [[<C-\><C-N><C-w>j]], opts)
vim.api.nvim_set_keymap("i", "<C-k>", [[<C-\><C-N><C-w>k]], opts)
vim.api.nvim_set_keymap("i", "<C-l>", [[<C-\><C-N><C-w>l]], opts)
-- Normal mode
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)
