-- Minimalistic Neovim Configuration

-- ============================================================================
-- GENERAL SETTINGS
-- ============================================================================

-- Use space as leader key
-- This sets the prefix key for custom keybindings (e.g., <Space>w for window commands)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UTF-8 encoding
-- Ensures proper handling of international characters and special symbols
vim.opt.encoding = "utf-8"

-- ============================================================================
-- UI SETTINGS
-- ============================================================================

-- Line numbers with relative positioning
-- 'number': shows absolute line number at cursor
-- 'relativenumber': shows relative line numbers from cursor (useful for motions like 5j to jump 5 lines)
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight current line
-- Adds a horizontal line under the cursor for easier tracking
vim.opt.cursorline = true

-- Show command as you type
-- Displays partial commands in the status line as you enter them (e.g., "3" when you press 3)
vim.opt.showcmd = true

-- Better visual feedback
-- Uses a visual flash instead of beeping sound when you hit errors
vim.opt.visualbell = true

-- ============================================================================
-- INDENTATION
-- ============================================================================

-- Use spaces instead of tabs
-- When you press Tab, it inserts spaces instead of a tab character
vim.opt.expandtab = true

-- Number of spaces per tab
-- 'tabstop': how many spaces = 1 tab when reading existing files
-- 'shiftwidth': how many spaces to use for indentation with > and < operators
-- 'softtabstop': how many spaces = 1 tab when editing
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Auto-indent new lines
-- 'autoindent': copies indentation from previous line
-- 'smartindent': context-aware indentation (adds extra indent after {, removes after })
vim.opt.autoindent = true
vim.opt.smartindent = true

-- ============================================================================
-- SEARCH
-- ============================================================================

-- Highlight search results
-- Makes all occurrences of your search term highlighted in the file
vim.opt.hlsearch = true

-- Incremental search (search as you type)
-- Jumps to matches while you're still typing your search term
vim.opt.incsearch = true

-- Case-insensitive search (unless uppercase used)
-- 'ignorecase': search is case-insensitive
-- 'smartcase': if you type uppercase, search becomes case-sensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- ============================================================================
-- BUFFER & WINDOW
-- ============================================================================

-- Allow hidden buffers
-- Lets you switch between open files without saving (keeps unsaved changes in background)
vim.opt.hidden = true

-- Split window behavior
-- 'splitbelow': new horizontal splits appear below the current window
-- 'splitright': new vertical splits appear to the right of the current window
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Scroll offset (lines visible above/below cursor)
-- Keeps cursor away from edges, showing 8 lines of context on each side
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- ============================================================================
-- PERFORMANCE
-- ============================================================================

-- Update time for swap file and status line
-- Milliseconds before swap file is written and completion triggers (lower = faster, but uses more CPU)
vim.opt.updatetime = 250

-- Faster completion
-- 'menu': show completion menu even with single match
-- 'menuone': show menu even if only one match
-- 'noselect': don't automatically select first completion item
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- ============================================================================
-- KEYBINDINGS
-- ============================================================================

-- Clear search highlighting with Escape
-- Press Esc to remove highlighting from previous searches
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Better window navigation
-- Use Ctrl+hjkl to move between windows (left, down, up, right)
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

-- Better indenting in visual mode
-- Press < or > in visual mode to indent left/right, stays selected for repeated indenting
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })

-- Move lines up and down
-- In normal mode: Alt+j/k moves current line down/up
-- In visual mode: Alt+j/k moves selected block down/up
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==", { noremap = true })
vim.keymap.set("n", "<A-j>", ":move .+1<CR>==", { noremap = true })
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv", { noremap = true })
