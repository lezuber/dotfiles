" -------------------------------------------------------------
" Symlinked into nvim folder
" based on:
" https://dougblack.io/words/a-good-vimrc.html
" -------------------------------------------------------------

" Plug {{{
" Plugin manager
" -------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.

Plug 'itchyny/lightline.vim'
Plug 'tyrannicaltoucan/vim-quantum'

Plug 'tpope/vim-surround' " change surroundings with e.g. csiw
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'       " Add Git Functionality
Plug 'airblade/vim-gitgutter'   " Show git status of each line left of line number
Plug 'ap/vim-buftabline'        " Line of Buffers in the Tabline
Plug '/usr/local/opt/fzf'       " Bind lcl fzf
Plug 'junegunn/fzf.vim'			" fuzzy finder
Plug 'scrooloose/nerdtree'
Plug 'alvan/vim-closetag'
Plug 'qpkorr/vim-bufkill'       " dont close window when kill buffer
Plug 'ryanoasis/vim-devicons'   " Filetype icons
Plug 'vim-syntastic/syntastic'  " Error checking
Plug 'Valloric/YouCompleteMe'

call plug#end()
" }}}

" Core (e.g. Python) {{{
let g:python3_host_prog = '/Users/Lenz/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog = '/Users/Lenz/.pyenv/versions/neovim2/bin/python'
" }}}
"
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
set hidden          " Allow having unchanged buffers in background

" Relative Line number, only in normal mode 
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" start scrowling already at 75% of the window
autocmd VimEnter,WinEnter * let &scrolloff = winheight(0) / 4
" }}}

" Projectdrawer, Searching & Folding {{{
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" Netrw setup
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4

" Wildmenue search for opening files efficient
set wildmenu
        set wildignorecase
set wildmode=list:full  "list files and let the user choose with the wildmene

set wildignore+=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=*/min/*
set wildignore+=tags,cscope.*
set wildignore+=*.tar.*

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
map <space> <leader>
map <leader><space> za
nnoremap j gj
nnoremap k gk

" shorten window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <C-N> :bnext<CR>       " Easy switching btw tabs
nnoremap <C-P> :bprev<CR>

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>

" Nerdtree bindings 
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <leader>f :NERDTreeToggle<cr>

" Binding to focus on a window easily
map <leader>o :tabnew %<CR>

" }}}

" Colors {{{
let g:quantum_black=1
let g:airline_theme='quantum'
colorscheme quantum
" }}}

" Syntastic {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

function Py2()
  let g:syntastic_python_python_exec = '/Users/Lenz/.pyenv/versions/neovim2/bin/python'
endfunction

function Py3()
  let g:syntastic_python_python_exec = '/Users/Lenz/.pyenv/versions/neovim3/bin/python'
endfunction

call Py2()   " default to Py3 because I try to use it when possible

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" }}}

" vim:foldmethod=marker:foldlevel=0
