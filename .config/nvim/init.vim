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
Plug 'nvim-telescope/telescope.nvim'
Plug 'dracula/vim'
call plug#end()

colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for >") })<CR>




