function Main()
    call Vundle_settings()
    call Plugin_settings()
    filetype plugin indent on

    call NERDTree_settings()
    call Tagbar_settings()
    call Syntastic_settings()
    call Python_mode_settings()
    call Pythoncomplete_settings()
    call Ctrlp_settings()

    call Editor_settings()
endfunction

function Vundle_settings()
    filetype off  
    set rtp+=$VIM/vimfiles/bundle/vundle/  
    call vundle#rc('$VIM/vimfiles/bundle/')  
    Bundle 'gmarik/vundle'  
    filetype plugin indent on  
endfunction

function Plugin_settings()
    Bundle "klen/python-mode"
    Bundle "scrooloose/syntastic"
    Bundle "scrooloose/nerdcommenter"
    Bundle "scrooloose/nerdtree"
    Bundle "majutsushi/tagbar"
    Bundle "vim-scripts/pythoncomplete"
    Bundle "ctrlpvim/ctrlp.vim"
endfunction

function NERDTree_settings()
    map <F3> :NERDTreeToggle<CR>
endfunction

function Tagbar_settings()
    nmap <F10> :TagbarToggle<CR>
endfunction
 
function Editor_settings()
    syntax on
    set sw=4
    set ts=4
    set sts=4
    set expandtab
    set nu
    set autoindent
endfunction

function Syntastic_settings()
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
endfunction

function Python_mode_settings()
    let g:pymode_rope_goto_definition_bind = "<C-]>"
    let g:pymode_run_bind = "<C-S-e>"
    let g:pymode_doc_bind = "<C-S-d>"
endfunction

function Pythoncomplete_settings()
    autocmd FileType python set omnifunc=pythoncomplete#Complete  
endfunction

function Ctrlp_settings()
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
endfunction

call Main()
