map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2  
let NERDTreeShowBookmarks=1 
let NERDTreeMinimalUI=1 

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nmap <F9> :TagbarToggle<CR>

set autoindent 
set tabstop=4
set softtabstop=4
set shiftwidth=6
set autoindent 
set tabstop=4
set softtabstop=4
set shiftwidth=4

set expandtab 
set number 
set hlsearch 

set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'unicode'
set encoding=utf8

filetype on 
noswapfile
color desert
syntax on
filetype plugin on

let g:pydiction_location = 'E:\Program Files (x86)\Vim\vimfiles\complete-dict'

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
