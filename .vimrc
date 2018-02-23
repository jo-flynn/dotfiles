" Plugin
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhartington/oceanic-next'
" Initialize plugin system
call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
""If you're using tmux version 2.2 or later, you can remove the outermost
" $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more
"information.)
if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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
colorscheme OceanicNext
set showtabline=2
set noshowmode
set noruler
"set background=dark
set t_Co=256
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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/.git/*     " MacOSX/Linux

hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic
hi xmlAttrib  cterm=italic
let g:jsx_ext_required = 0
