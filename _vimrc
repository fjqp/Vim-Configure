map <C-F1> :NERDTreeToggle<CR>
imap <C-F1> <ESC> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2  
let NERDTreeShowBookmarks=1 
let NERDTreeMinimalUI=1 

:nmap <silent> <C-F2> <ESC>:Tlist<RETURN>
let Tlist_Auto_Open=0 
let Tlist_Show_One_File = 1 
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1  
let Tlist_Use_Right_Window = 1 
let Tlist_Sort_Type = "name"    
let Tlist_Ctags_Cmd = 'ctags'

set autoindent 
set tabstop=4
set softtabstop=4
set shiftwidth=4

set expandtab 
set number 
set hlsearch 

filetype on 

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8

noswapfile
set go=
color ron

"git快捷键设置
nmap <S-F1> :call InitGit()<CR>
function! InitGit()
    while 1 == 1
        let ms = input("Do you want to run git init?[yes/no]:")
        echo "\n"
        if ms == 'yes'
            let passwd = input('YOUR PASSWD:')
            if passwd == 'fjqp@outlook.com'
                let user_name = input('user.name:')
                let user_email = input('user.email:')

                if strlen(user_name) == 0
                    echo "\n"
                    echo "user name can't be none."
                    continue
                elif strlen(user_email) == 0
                    echo "\n"
                    echo "user email can't be none."
                    continue
                endif

                exec "!git init"
                exec join(["!git config --global user.name", user_name])
                exec join(["!git config --global user.email", user_email])
                exec "!git config --global core.editor vim"
                exec "!git config --global core.quotepath false"
                exec "!git config --global merge.tool vimdiff"
                exec "!git config --list"
            else
                echo "\n"
                echo "Please give the correct password."
            endif    
        elseif ms == 'no'
            break
        endif    
    endwhile
        
    endfunction

nmap <S-F2> :call AddRemote()<CR>
function! AddRemote()
    let rn = ''
    let ru = ''
    while 1 ==1 
        let ms = input('Do you want to add a remote repos?[yes/no]:')
        if ms == "yes"
            let passwd = input('YOUR PASSWORD:')
            if passwd == 'fjqp'
                let rn = input('remote name:')
                let ru = input('remote url:')
                if strlen(rn) == 0
                    echo "remote name can't be none"
                    continue
                endif 
                if strlen(ru) == 0
                    echo "remote url can't be none"
                    continue
                endif

                let cmd = join(['!git remote add', rn,ru])
                echo '\n'
                let ms = join(['You will exec', cmd])
                echo ms
                exec input('Press any key to exec it')
                exec cmd
            else
                echo join(['\n','Please give the correct password.'])
            endif
        else
            echo "\n"
            break
        endif
    endwhile

endfunction

nmap <S-F3> :exec "!git status"<CR>
nmap <S-F4> :exec "!git add %"<CR>
nmap <S-F5> :exec '!git commit -m "commit %"'<CR>

nmap <S-F6> :call GitPush()<CR>
function! GitPush()
    exec "!git diff"
    exec "!git branch -a"

    let rn = ''
    while 1 == 1
        let rn = input('remote name you want to push:')
        echo "\n"
        if strlen(rn) == 0
            echo "remote name can't be none"
        else
            break
        endif
    endwhile
    let cmd = join(["!git push --set-upstream",rn, 'master'])

    exec cmd
endfunction
