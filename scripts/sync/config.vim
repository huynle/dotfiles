" ####### Auto Completion
" let g:mucomplete#enable_auto_at_startup = 1
" let g:syntastic_check_on_open = 0
let g:gutentags_modules = []


" on save
let b:enable_rsync  = 1

" VNC server
let b:rsync_server  = "vnc1"
let b:rsync_remote  = "~/.config/nvim"

" " ## VTB2 SERVER
" let b:rsync_server  = "vtb2"
" let b:rsync_remote  = "~/src/devver"

" DON't end with forward slash
" let b:rsync_local   = "/cygdrive/c/Users/e367212/"."src/devver"
let b:rsync_local   = "/home/e367212/.dotfiles/.config/nvim"
let b:rsync_exclude = ".project/rsync_exclude"
