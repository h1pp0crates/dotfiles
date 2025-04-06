:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set softtabstop=4
:set mouse=a
:set encoding=UTF-8
:set scrolloff=7


call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/neoclide/coc.nvim'


call plug#end()

nnoremap <C-d> :CocDisable<Cr>
nnoremap <C-e> :CocEnable<Cr>

set background=dark
colorscheme onehalfdark


nnoremap <C-s> :wq<Cr>
inoremap jj <Esc>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O

