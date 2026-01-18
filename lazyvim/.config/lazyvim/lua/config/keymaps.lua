-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- control + c to escape in insert mode
vim.keymap.set({ "i", "v", "s" }, "<C-c>", "<Esc>", { noremap = true })
-- _ behaves likes ^ in both normal and visual mode
vim.keymap.set({ "n", "v" }, "_", "^", { noremap = true })
