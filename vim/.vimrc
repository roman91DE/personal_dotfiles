
" ============================================================================
" MINIMALISTIC VIM/NEOVIM SHARED CONFIGURATION
" ============================================================================
" This file contains all common settings for both Vim and Neovim
" Source this file from your .vimrc or init.lua

" ============================================================================
" GENERAL SETTINGS
" ============================================================================

" UTF-8 encoding
set encoding=utf-8

" ============================================================================
" UI SETTINGS
" ============================================================================

" Line numbers with relative positioning
" 'number': shows absolute line number at cursor
" 'relativenumber': shows relative line numbers from cursor (useful for motions like 5j to jump 5 lines)
set number
set relativenumber
set ruler

" Highlight current line
" Adds a horizontal line under the cursor for easier tracking
set cursorline

" Show command as you type
" Displays partial commands in the status line as you enter them (e.g., "3" when you press 3)
set showcmd

" Better visual feedback
" Uses a visual flash instead of beeping sound when you hit errors
set visualbell

" ============================================================================
" INDENTATION
" ============================================================================

" Use spaces instead of tabs
" When you press Tab, it inserts spaces instead of a tab character
set expandtab

" Number of spaces per tab
" 'tabstop': how many spaces = 1 tab when reading existing files
" 'shiftwidth': how many spaces to use for indentation with > and < operators
" 'softtabstop': how many spaces = 1 tab when editing
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Auto-indent new lines
" 'autoindent': copies indentation from previous line
" 'smartindent': context-aware indentation (adds extra indent after {, removes after })
set autoindent
set smartindent

" ============================================================================
" SEARCH
" ============================================================================

" Highlight search results
" Makes all occurrences of your search term highlighted in the file
set hlsearch

" Incremental search (search as you type)
" Jumps to matches while you're still typing your search term
set incsearch

" Case-insensitive search (unless uppercase used)
" 'ignorecase': search is case-insensitive
" 'smartcase': if you type uppercase, search becomes case-sensitive
set ignorecase
set smartcase

" ============================================================================
" BUFFER & WINDOW
" ============================================================================

" Split window behavior
" 'splitbelow': new horizontal splits appear below the current window
" 'splitright': new vertical splits appear to the right of the current window
set splitbelow
set splitright

" Scroll offset (lines visible above/below cursor)
" Keeps cursor away from edges, showing 8 lines of context on each side
set scrolloff=8
set sidescrolloff=8

" ============================================================================
" PERFORMANCE & BEHAVIOR
" ============================================================================

" Update time for swap file and status line
" Milliseconds before swap file is written and completion triggers (lower = faster, but uses more CPU)
set updatetime=250

" Backspace behavior
set backspace=indent,eol,start

" Use system clipboard
set clipboard=unnamedplus

" Persistent undo
set undofile

" Auto-reload changed files
set autoread

" ============================================================================
" COLORS & VISUAL
" ============================================================================

" Enable syntax highlighting
syntax on

" Enable 24-bit colors
set termguicolors

" Dark background
set background=dark

" Always show status line
set laststatus=2

