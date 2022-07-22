set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set exrc
set guicursor=
set relativenumber
set hidden
set noerrorbells
set nu
set nowrap
set incsearch
set nohlsearch 
set termguicolors
set scrolloff=8
set signcolumn=yes

" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
" FZF
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" THEME
Plug 'dracula/vim'

" Disable HJKL and Arrow Keys
Plug 'wikitopian/hardmode'
call plug#end()

colorscheme dracula

set background=dark

" hjkl also off
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
