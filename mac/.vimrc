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

:match ErrorMsg '\%>100v.\+'

:highlight BadWS ctermbg=darkgreen
:match BadWS /\s\+$/
:match BadWS /\t/
