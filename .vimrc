" Plugin manager
" -------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tyrannicaltoucan/vim-quantum'


call plug#end()
" -------------------------------------------------------------


" Normal Config part
" -------------------------------------------------------------
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set number          " show line numbers
set showcmd         " show last command in bottom bar
set cursorline      " highlight current line
set termguicolors   " true color support

let g:quantum_black=1
let g:airline_theme='quantum'
colorscheme quantum


