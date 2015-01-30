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

" Get tabs to act right
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set mouse=a
nmap <C-t> :!pdflatex %<CR>

autocmd FileType html setlocal indentkeys=""

:match ErrorMsg '\%>80v.\+'

:highlight BadWS ctermbg=darkgreen
:match BadWS /\s\+$\|\t/
set showmatch  "Highlight matching braces
" Syntax highlighting and stuff
filetype plugin indent on
syntax on
let g:load_doxygen_syntax=1

