set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Bundle "Markdown"

" Git integration
Bundle "git.zip"
Bundle "fugitive.vim"
Bundle "surround.vim"
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'wincent/command-t'

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
colorscheme solarized
set background=dark

" searches
set ignorecase
set showmode 
:imap ;; <Esc>

" no backups/swap
set nobackup
set nowritebackup  
set noswapfile 

" configure things
let g:solarized_termtrans=0
let g:solarized_termcolors=256
let g:airline_powerline_fonts=1
set t_Co=256
