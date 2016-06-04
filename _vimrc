map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2  
let NERDTreeShowBookmarks=1 
let NERDTreeMinimalUI=1 

:nmap <silent> <F9> <ESC>:Tlist<RETURN>
let Tlist_Auto_Open=0 
let Tlist_Show_One_File = 1 
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1  
let Tlist_Use_Right_Window = 1 
let Tlist_Sort_Type = "name"    
let Tlist_Ctags_Cmd = 'ctags'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

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

filetype on 
noswapfile
color desert
syntax on

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

