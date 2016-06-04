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
        let ms = input("INFO:Do you want to run git init?[yes/no]:")
        echo "\n"
        if ms == 'yes'
            let passwd = input('INFO:YOUR PASSWD:')
            if passwd == 'fjqp@outlook.com'
                let user_name = input('user.name:')
                let user_email = input('user.email:')

                if strlen(user_name) == 0
                    echo "\n"
                    echo "INFO:user name can't be none."
                    continue
                elseif strlen(user_email) == 0
                    echo "\n"
                    echo "INFO:user email can't be none."
                    continue
                endif

                exec "!git init"
                exec join(["!git config --global user.name", user_name])
                exec join(["!git config --global user.email", user_email])
                exec "!git config --global core.editor vim"
                exec "!git config --global core.quotepath false"
                exec "!git config --global merge.tool vimdiff"
                exec "!git config --global credential.helper wincred"
                exec "!git config --list"
                break
            else
                echo "\n"
                echo "INFO:Please give the correct password."
            endif    
        else
            break
        endif    
    endwhile
endfunction

nmap <S-F2> :call AddRemote()<CR>
function! AddRemote()
    let rn = ''
    let ru = ''
    while 1 ==1 
        let ms = input('INFO:Do you want to add a remote repos?[yes/no]:')
        if ms == "yes"
            let passwd = input('INFO:YOUR PASSWORD:')
            if passwd == 'fjqp'
                let rn = input('INFO:remote name:')
                let ru = input('INFO:remote url:')
                if strlen(rn) == 0
                    echo "\n"
                    echo "INFO:remote name can't be none"
                    continue
                endif 

                if strlen(ru) == 0
                    echo "\n"
                    echo "INFO:remote url can't be none"
                    continue
                endif

                let cmd = join(['!git remote add', rn,ru])
                echo '\n'
                let ms = join(['INFO:You will exec', cmd])
                echo ms
                exec input('INFO:Press any key to exec it')
                exec cmd
                break
            else
                echo "\n"
                echo 'INFO:Please give the correct password.'
            endif
        else
            echo "\n"
            break
        endif
    endwhile
endfunction

nmap <S-F3> :exec "!git status"<CR>

nmap <S-F4> :exec "!git branch -a"<CR>

nmap <S-F5> :exec "!git add %"<CR>

nmap <S-F6> :call Commit()<CR>
func! Commit()
    let comment = input('INFO:comment:')
    if strlen(comment) == 0
        echo "\n"
        echo "INFO:please give the valid git commit -m comment."
    else
        exec join(['!git commit -m', comment])
    endif
endfunc

nmap <S-F7> :exec "!git diff"<CR>

nmap <S-F8> :call GitPush()<CR>
function! GitPush()
    let rn = ''
    while 1 == 1
        let rn = input('INFO:remote name you want to push:')
        echo "\n"
        if strlen(rn) == 0
            echo "\n"
            echo "INFO:remote name can't be none"
        else
            let cmd = join(["!git push --set-upstream",rn, 'master'])
            exec cmd
            break
        endif
    endwhile
endfunction

nmap <S-F9> :exec "!git log"<CR>

nmap <S-F10> :call ShowLog()<CR>
function! ShowLog()
    while 1 == 1
        let log = input("INFO:log:")
        if strlen(log) == 0
            echo "\n"
            echo "INFO:log name can't be none."
            continue
        else
            exec join(['!git show', log])
            break
        endif
    endwhile
endfunction

nmap <S-F11> :call CheckoutNewBranch()<CR>
function! CheckoutNewBranch()
    let branch = input("INFO:You will create a new branch, type into the branch name you want:")
    if strlen(branch) == 0
        echo "\n"
        echo "INFO:branch name can't be none."
    else
        exec join(["!git checkout -b",branch])
    endif
endfunction

nmap <S-F12> :call SwitchBranch()<CR>
function! SwitchBranch()
    let branch = input("INFO:Please type into the branch name that you want to switch:")
    if strlen(branch) == 0
        echo "\n"
        echo "INFO:branch name can't be none"
    else
        exec join(['!git checkout', branch])
    endif
endfunction

nmap <C-S-F1> :call DeleteBranch()<CR>
function! DeleteBranch()
    let branch = input("INFO:Please type into the branch name to delete:")
    if strlen(branch) == 0
        echo "\n"
        echo "INFO:branch name can't be none."
    else
        exec join(['!git branch -D', branch])
    endif
endfunction

nmap <C-S-F2> :exec "!git stash"<CR>
nmap <C-S-F3> :exec "!git stash pop"<CR>
nmap <C-S-F4> :call Merge()<CR>
func! Merge()
    let branch = input("INFO:Please type into the branch to merge:")
    if strlen(branch) == 0
        echo "\n"
        echo "INFO:branch name can't be none."
    else
        exec "!git checkout master"
        exec join(["!git merge", branch])
    endif
endfunc

nmap <C-S-F5> :call Pull()<CR>
func! Pull()
    let branch = input("INFO:Please type into the remote branch name to pull:")
    if strlen(branch) == 0
        echo "\n"
        echo "INFO:branch name can't be none."
    else
        exec join(["!git pull", branch, "master"])
    endif
endfunc
