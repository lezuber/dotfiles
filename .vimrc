" -------------------------------------------------------------
" based on:
" https://dougblack.io/words/a-good-vimrc.html
" -------------------------------------------------------------

" Plug {{{
" Plugin manager
" -------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tyrannicaltoucan/vim-quantum'

Plug 'tpope/vim-surround' " change surroundings with e.g. csiw
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'

call plug#end()
" }}}

" Spaces & Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set number          " show line numbers
" }}}

" UI Layout {{{
set showcmd         " show last command in bottom bar
set cursorline      " highlight current line
set termguicolors   " true color support
set cursorline      " highlight current line

" Relative Line number, only in normal mode 
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" }}}

" Searching & Folding {{{
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
" space open/closes folds
nnoremap <space> za
" }}}

" Backups {{{
" temprary files will be saved in a tmp folder
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" Keybindings {{{
" with this indent lines wont be skipped with j and k 
let mapleader = ","
nnoremap j gj
nnoremap k gk
" }}}

" Colors {{{
let g:quantum_black=1
let g:airline_theme='quantum'
colorscheme quantum
" }}}

" vim:foldmethod=marker:foldlevel=0
