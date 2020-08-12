" ####### Auto Completion
let g:mucomplete#enable_auto_at_startup = 1

""""" CSCOPE
let g:quickr_cscope_db_file = "cscope.out"

"""" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['pylint']
" pylintrc-gen is the default generated file by pylint
let g:syntastic_python_pylint_args = '--rcfile=pylintrc-gen'



""""" Rsync
" on save
let b:enable_rsync  = 1
" VNC server
let b:rsync_server  = "vnc3"
let b:rsync_remote  = "~/vpuh/devver"
" DON't end with forward slash
let b:rsync_local   = "/cygdrive/c/Users/e367212/"."src/devver"
let b:rsync_exclude = ".project/rsync_exclude"
