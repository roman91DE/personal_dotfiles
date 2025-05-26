-- Minimal Neovim config with nice defaults

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
