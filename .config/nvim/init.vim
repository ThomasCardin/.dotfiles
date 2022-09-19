source $HOME/.config/nvim/plug-config/coc.vim

syntax on
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

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'morhetz/gruvbox'
call plug#end()

hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * ++nested 

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for >") })<CR>




