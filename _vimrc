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
        let branch = input('INFO:Please type into the branch you want to push:')
        echo "\n"
        if strlen(rn) == 0
            echo "\n"
            echo "INFO:remote name can't be none"
        elsif strlen(branch) == 0
            echo "\n"
            echo "INFO:branch name can't be none."
        else
            let cmd = join(["!git push --set-upstream",rn, branch])
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

nmap <C-S-F2> :call DeleteRemoteBranch()<CR>
function! DeleteRemoteBranch()
    let branch = input("INFO:Please type into the branch name to delete:")
    if strlen(branch) == 0
        echo "\n"
        echo "INFO:branch name can't be none."
    else
        exec join(['!git branch -r -d', branch])
    endif
endfunction


nmap <C-S-F3> :exec "!git stash"<CR>
nmap <C-S-F4> :exec "!git stash pop"<CR>
nmap <C-S-F5> :call Merge()<CR>
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

nmap <C-S-F6> :call Pull()<CR>
func! Pull()
    let branch = input("INFO:Please type into the remote branch name to pull:")
    if strlen(branch) == 0
        echo "\n"
        echo "INFO:branch name can't be none."
    else
        exec join(["!git pull", branch, "master"])
    endif
endfunc

nmap <C-S-F7> :call Reset()<CR>
func! Reset()
    let commit_index = input("INFO:Please type into the commit_index name you want to back:")
    if strlen(commit_index) == 0
        echo "\n"
        echo "INFO:commit_index name can't be none."
    else
        exec join(['!git reset', commit_index])
    endif
endfunc

"Django相关快捷键
"Ctrl + F1 创建虚拟环境
"1. cd到用户想要创建虚拟环境的目录
"2. 请求用户输入虚拟环境名称
"3. 根据名称创建虚拟环境
"4. 激活虚拟环境
nmap <C-F1> :call CreateVirtualenv()<CR>
func! CreateVirtualenv()
    let dir = input("INFO:Please type into the directory that you want to create the virtuanenv for django project:")
    if strlen(dir) == 0
        echo "\n"
        echo "INFO:dir can't be none."
    else
        exec join(["!cd",dir])
    endif

    let vir = input("INFO:Please type into the virtualenv name you wanto created:")
    if strlen(vir) == 0
        echo "\n"
        echo "INFO:vir can't be none."
    else
        exec join(["!virtualenv",vir])
        exec join["!cd",vir,"\Scripts"])
        exec "!activate.bat"
    endif
endfunc

"Ctrl + F2 安装模块
nmap <C-F2> :call PipInstall()<CR>
func! PipInstall()
    let module = input("INFO:Please type into the module name:")
    if strlen(module) == 0
        echo "\n"
        echo "INFO:module name can't be none."
    else
        exec join(["!pip install", module])
    endif
endfunc

"Ctrl + F3 创建django项目
"1. cd 到用户想要创建工程的目录
"2. 请求用户输入工程名
"3. 根据工程名创建项目
nmap <C-F3> :call CreateDjangoProject()<CR>
func! CreateDjangoProject()
    let dir = input("INFO:Please type into the directory that you want to create the project name for django project:")
    if strlen(dir) == 0
        echo "\n"
        echo "INFO:dir can't be none."
    else
        exec join(["!cd",dir])
    endif
    
    let pro = input("INFO:Please type into the project name:")
    if strlen(pro) == 0
        echo "\n"
        echo "INFO:project name can't be none."
    else
        exec join(['django-admin startproject', pro])
    endif
endfunc

"Ctrl + F4 创建app
"1. cd到manage.py 目录
"2. 请求用户输入app名称
"3. 更具app名创建app名称
nmap <C-F4> :call CreateDjangoApp()<CR>
func! CreateDjangoApp()
    echo join([" ******************************************************************************************************\n", "*****************************Create Virtualenv For Django Project*************************************\n", "******************************************************************************************************"])
    let dir = input("INFO:Please type into the directory that you want to create the app name for django project:")
    if strlen(dir) == 0
        echo "\n"
        echo "INFO:dir can't be none."
    else
        exec join(["!cd",dir])
    endif
    
    let app = input("INFO:Please type into the app name taht you want to created:") 
    if strlen(app) == 0
        echo "\n"
        echo "INFO:app name can't be none."
    else
        exec join(["!python manage.py startapp", app])
    endif
endfunc
