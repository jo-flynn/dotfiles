set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Bundle "Markdown"
Bundle "git.zip"
Bundle "fugitive.vim"
Bundle "surround.vim"
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'groenewege/vim-less'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set number
set backspace=indent,eol,start
set incsearch
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cursorline
set background=dark
colorscheme solarized
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

" configure things
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*._,.fuse_*,.DS_Store,*.smbdelete     " MacOSX/Linux
" Setup some default ignores
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in
" version control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'
