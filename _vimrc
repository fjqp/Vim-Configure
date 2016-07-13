function Main()
    call Vundle_settings()
    call Plugin_settings()
    filetype plugin indent on

    call NERDTree_settings()
    call Tagbar_settings()
    call Ctrlp_settings()
	call Auto_pairs_settings()
    call RunAndDebugPython_settings()
    call PlayMp3_settings()
    call YouCompleteMe_settings()
	
    call Editor_settings()
endfunction

function Vundle_settings()
    filetype off  
    set rtp+=$VIM/vimfiles/bundle/Vundle.vim/  
    call vundle#rc('$VIM/vimfiles/bundle/')  
    Bundle 'VundleVim/Vundle.vim'  
    filetype plugin indent on  
endfunction

function Plugin_settings()
    Bundle "scrooloose/nerdtree"
    Bundle "majutsushi/tagbar"
    Bundle "ctrlpvim/ctrlp.vim"
    Bundle "vim-scripts/statusline.vim"
	Bundle "jiangmiao/auto-pairs"
    Bundle "fjqp/BackgroundMusic"
    Bundle "fjqp/RunAndDebugPython"
    Bundle 'Valloric/YouCompleteMe'
    Bundle "Yggdroot/indentLine"
endfunction

function NERDTree_settings()
    autocmd vimenter * if !argc() | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

    let NERDTreeIgnore=['\.pyc']
    map <F3> :NERDTreeToggle<CR>
endfunction

function Tagbar_settings()
    nmap <F10> :TagbarToggle<CR>
endfunction
 
function Editor_settings()
    set fileformat=unix
    set encoding=utf-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
    syntax on
    set sw=4
    set ts=4
    set sts=4
    set expandtab
    set nu
    set autoindent

    set nocompatible
    set nobackup
    set noswapfile
    set ignorecase
    set magic
    set cul
    set cuc
    autocmd InsertLeave * se cul
    set ruler
    set showcmd
endfunction

function Ctrlp_settings()
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
endfunction

function Auto_pairs_settings()
	let g:AutoPairsFlyMode = 1
endfunction

function RunAndDebugPython_settings()
    map <leader>r :call RunPython()<CR>
    map <leader>d :call DebugPython()<cr>
endfunction

function PlayMp3_settings()
    source $VIM/vimfiles/bundle/BackgroundMusic/plugin/mp3Play.vim
    call PlayMp3()
endfunction

function YouCompleteMe_settings()
    nnoremap <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>

    let g:ycm_error_symbol = '>E'
    let g:ycm_warning_symbol = '>W'
endfunction

call Main()
