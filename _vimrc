function Main()
    call Vundle_settings()
    call Plugin_settings()
    filetype plugin indent on

    call NERDTree_settings()
    call Tagbar_settings()
    call Syntastic_settings()
    call Python_mode_settings()
    call Ctrlp_settings()
	call Neocomplcache_settings()
	call Auto_pairs_settings()
	call Pydiction_settings()
    call RunAndDebugPython_settings()
    call PlayMp3_settings()
	
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
    Bundle "klen/python-mode"
    Bundle "scrooloose/syntastic"
    Bundle "scrooloose/nerdcommenter"
    Bundle "scrooloose/nerdtree"
    Bundle "majutsushi/tagbar"
    Bundle "ctrlpvim/ctrlp.vim"
    Bundle "AD7six/vim-activity-log"
    Bundle "vim-scripts/Rainbow-Parentheses-Improved"
    Bundle "vim-scripts/statusline.vim"
    Bundle "upsuper/vim-colorschemes"
	Bundle "Shougo/neocomplcache.vim"
	Bundle "jiangmiao/auto-pairs"
	Bundle "rkulla/pydiction"
    Bundle "fjqp/BackgroundMusic"
    Bundle 'fjqp/BaiduSearch'
    Bundle "fjqp/RunAndDebugPython"
endfunction

function NERDTree_settings()
    map <F3> :NERDTreeToggle<CR>
endfunction

function Tagbar_settings()
    nmap <F10> :TagbarToggle<CR>
endfunction
 
function Editor_settings()
    color molokai
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
	let g:pymode_motion = 0
	let g:pymode_virtualenv = 0
	let g:pymode_run = 0
	let g:pymode_breakpoint = 1
	let g:pymode_rope_completion = 0
	let g:pymode_rope_complete_on_dot = 0
endfunction

function Ctrlp_settings()
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
endfunction

function Neocomplcache_settings()
	"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	" Use neocomplcache.
	let g:neocomplcache_enable_at_startup = 1
	" Use smartcase.
	let g:neocomplcache_enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplcache_min_syntax_length = 3
	let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

	" Enable heavy features.
	" Use camel case completion.
	"let g:neocomplcache_enable_camel_case_completion = 1
	" Use underbar completion.
	"let g:neocomplcache_enable_underbar_completion = 1

	" Define dictionary.
	let g:neocomplcache_dictionary_filetype_lists = {
		\ 'default' : '',
		\ 'vimshell' : $HOME.'/.vimshell_hist',
		\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

	" Define keyword.
	if !exists('g:neocomplcache_keyword_patterns')
		let g:neocomplcache_keyword_patterns = {}
	endif
	let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplcache#undo_completion()
	inoremap <expr><C-l>     neocomplcache#complete_common_string()

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
	  return neocomplcache#smart_close_popup() . "\<CR>"
	  " For no inserting <CR> key.
	  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplcache#close_popup()
	inoremap <expr><C-e>  neocomplcache#cancel_popup()
	" Close popup by <Space>.
	"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

	" For cursor moving in insert mode(Not recommended)
	"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
	"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
	"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
	"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
	" Or set this.
	"let g:neocomplcache_enable_cursor_hold_i = 1
	" Or set this.
	"let g:neocomplcache_enable_insert_char_pre = 1

	" AutoComplPop like behavior.
	"let g:neocomplcache_enable_auto_select = 1

	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplcache_enable_auto_select = 1
	"let g:neocomplcache_disable_auto_complete = 1
	"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	" Enable heavy omni completion.
	if !exists('g:neocomplcache_force_omni_patterns')
	  let g:neocomplcache_force_omni_patterns = {}
	endif
	let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
	let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

	" For perlomni.vim setting.
	" https://github.com/c9s/perlomni.vim
	let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endfunction

function Auto_pairs_settings()
	let g:AutoPairsFlyMode = 1
endfunction

function Pydiction_settings()
	let g:pydiction_location = '$VIM/vimfiles/pydiction/complete-dict'
endfunction

function RunAndDebugPython_settings()
    map <leader>r :call RunPython()<CR>
    map <leader>d :call DebugPython()<cr>
endfunction

function PlayMp3_settings()
    source $VIM/vimfiles/bundle/BackgroundMusic/plugin/mp3Play.vim
    call PlayMp3()
endfunction

call Main()
