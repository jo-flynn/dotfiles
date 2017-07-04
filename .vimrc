set nocompatible
filetype off

syntax on
set number
set backspace=indent,eol,start
set incsearch
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set cursorline
colorscheme industry
set showtabline=2

" easier split manipulation
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

" trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" searches
set ignorecase
set showmode
:imap ;; <Esc>

" no backups/swap
set nobackup
set nowritebackup
set noswapfile

" filetypes
au BufNewFile,BufRead *.ctp set filetype=php

