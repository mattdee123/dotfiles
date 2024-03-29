"let g:go_debug=['lsp']
"let g:go_gopls_options = ['-remote=auto', '-remote.debug=:0', '-remote.logfile=auto', '-logfile=auto', '-rpc.trace']
"let g:go_gopls_options = ['-debug=:0', '-remote=unix;/tmp/gopls-daemon-socket', '-logfile=auto', '-rpc.trace']

execute pathogen#infect()
" THIS MIGHT BE DANGEROUS :(
set noswapfile

set nocompatible
" This makes nerd commenter plugin and others use the comma
let mapleader=","

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

"" Switch syntax highlighting on
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
   "set breakindent
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

set textwidth=0
"set colorcolumn=+1
"highlight ColorColumn ctermbg=4

" Highlight tabs and trailing whitespace in green
highlight BadWS ctermbg=darkgreen
call matchadd('BadWs', '\s\+$\', 1)

" Delete trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

nnoremap ` :w<CR>
nnoremap \ :q<CR>
nnoremap E :e<CR>
" ccl closes quickfix box, lcl closes location list
nmap - :noh<CR>:ccl<CR>:lcl<CR>

nnoremap <c-n> :cn<CR>
nnoremap <c-m> :cN<cr>

nmap <Leader>y :call writefile(split(@@, "\n", 1), '/tmp/vimcopy')<CR>
nmap <leader>p :r! cat /tmp/vimcopy<CR>

 "Make FZF work right
nnoremap <c-p> :FZF<CR>
set rtp+=/usr/local/opt/fzf

" Always have a status line with with black bg (yes this is weird)
set laststatus=2
hi StatusLine ctermbg=white ctermfg=black

set relativenumber

" Completion
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noselect
inoremap <expr> <TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-n>" : "\<C-x>\<C-o>"

" Go stuff
au FileType go nmap <leader>b :GoTestCompile<CR>
au FileType go nmap <leader>B :GoBuild<CR>
au FileType go nmap <leader>T <Plug>(go-test)
au FileType go nmap <leader>cc <Plug>(go-coverage-clear)
au FileType go nmap <leader>C <Plug>(go-coverage)
au FileType go nmap <leader>t <Plug>(go-test-func)
au FileType go nmap <leader>; <Plug>(go-imports)
au FileType go nmap <leader>i <Plug>(go-implements)
au FileType go nmap <leader>d <Plug>(go-def)
au FileType go nmap <leader>r <Plug>(go-rename)
au FileType go nmap <leader>ml <Plug>(go-metalinter)
au FileType go nmap <leader>n <Plug>(go-info)
" also :GoImpl to generate interfaces
"
"
let g:go_highlight_diagnostic_errors = 0

nnoremap <leader>l :call system('codelink ' . expand('%:p') . ' ' . line('.'))<CR><CR>
vnoremap <leader>l :<C-U>call system('codelink ' . expand('%:p') . ' ' . line("'<") . ' ' . line("'>"))<CR><CR>

set regexpengine=0
