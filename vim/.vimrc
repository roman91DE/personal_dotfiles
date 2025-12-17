" ------------------------------------------------------------
" Minimal ~/.vimrc
" ------------------------------------------------------------

" Encoding
set encoding=utf-8

" Line numbers
set number              " show absolute number on current line
set relativenumber      " show relative numbers on all other lines

" Indentation
set tabstop=4           " display width of a tab
set shiftwidth=4        " indentation level
set expandtab           " convert tabs to spaces
set autoindent          " keep indentation from previous line
set smartindent         " smarter auto indents

" Search
set ignorecase          " case-insensitive search...
set smartcase           " ...unless uppercase used
set incsearch           " show matches incrementally
set hlsearch            " highlight search results

" UI / navigation
set mouse=a             " enable mouse
set nowrap              " don't wrap long lines
set cursorline          " highlight the current line
set numberwidth=3       " minimal width for line numbers
set scrolloff=5         " keep cursor away from screen edges
set signcolumn=yes      " prevent text shifting

" Behavior
set backspace=indent,eol,start
set clipboard=unnamedplus      " use system clipboard
set undofile                   " persistent undo
set hidden                     " allow switching buffers without saving
set autoread                   " auto-reload changed files

" Colors
syntax on
set termguicolors              " enable 24bit colors
set background=dark            " adjust for dark themes

" Status bar
set laststatus=2               " always show status line
set showcmd                    " show typed commands

" Splits
set splitbelow
set splitright
