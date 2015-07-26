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
set breakindent
set hlsearch
set incsearch
" Get tabs and indenting to act right
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

" THE BEST THING EVER; Vim with a mouse
set mouse=a

" Highlight characters over 80 lines red
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=4

" Highlight tabs and trailing whitespace in green
highlight BadWS ctermbg=darkgreen
call matchadd('BadWs', '\s\+$\|\t', 1)
" Delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
set showmatch  "Highlight matching braces

" Doxygen Plugin Preferences
let g:load_doxygen_syntax=1
let g:DoxygenToolkit_authorName="Matt Dee (medee)"
let g:DoxygenToolkit_versionString=""

nnoremap <C-o> o<Esc>
nnoremap ` :w<CR>
nnoremap \ :q<CR>
nmap <silent> <leader>t :NERDTreeToggle<CR>
" Make autocomplete work right
set wildmenu
set wildmode=longest,list
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'FZF'
