-- Minimal Neovim config with nice defaults


-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load Plugins via lazy vim here:  
require("lazy").setup({
  "tpope/vim-commentary",   -- Comment/Uncomment Lines using gc(c)
  -- "github/copilot.vim",  -- Dont need this in VSCode!
})

-- Enable relative line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Tab and indentation settings
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.shiftwidth = 4         -- Shift 4 spaces when tab
vim.opt.tabstop = 4            -- 1 tab == 4 spaces
vim.opt.smartindent = true     -- Auto-indent new lines

-- UI improvements
vim.opt.termguicolors = true   -- Enable true color support
vim.opt.cursorline = true      -- Highlight current line
vim.opt.scrolloff = 8          -- Keep cursor centered

-- Disable swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true        -- Persistent undo

-- Better search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Shorter messages and faster updates
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

-- Leader key
vim.g.mapleader = " "

-- Quick save mapping
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

-- Use the system clipboard
vim.opt.clipboard = "unnamedplus"

