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

" Make the status line show the name of the current file
set laststatus=2
hi StatusLine ctermbg=0 ctermfg=0

" Get tabs and indenting to act right
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

" THE BEST THING EVER; Vim with a mouse
set mouse=a

" Highlight characters over 80 lines red
match ErrorMsg '\%>80v.\+'

" Highlight tabs and trailing whitespace in green
highlight BadWS ctermbg=darkgreen
call matchadd('BadWs', '\s\+$\|\t', 1)
set showmatch  "Highlight matching braces

" Doxygen Plugin Preferences
let g:load_doxygen_syntax=1
let g:DoxygenToolkit_authorName="Matt Dee (medee)"
let g:DoxygenToolkit_versionString=""
