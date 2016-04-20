colorscheme ron
execute pathogen#infect()
" THIS MIGHT BE DANGEROUS :(
set noswapfile

set nocompatible
" This makes nerd commenter plugin and others use the comma
let mapleader=","

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show line numbers
set number
set ruler
set showcmd
set linebreak
set scrolloff=3
set tildeop
if exists("&breakindent")
    set breakindent
endif

" Make searching better
set hlsearch
set incsearch

set showmatch  "Highlight matching braces

" Get tabs and indenting to act right
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent

set mouse=a

set ignorecase
set smartcase

set textwidth=85
set colorcolumn=+1
highlight ColorColumn ctermbg=4

" Highlight tabs and trailing whitespace in green
highlight BadWS ctermbg=darkgreen
call matchadd('BadWs', '\s\+$\|\t', 1)

" Delete trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

nnoremap ` :w<CR>
nnoremap \ :q<CR>
" Make autocomplete work right
nnoremap <c-p> :FZF<CR>

" Always have a status line with with black bg (yes this is weird)
set laststatus=2
hi StatusLine ctermbg=white ctermfg=black

set relativenumber

au BufRead,BufNewFile *.sig set filetype=sml
