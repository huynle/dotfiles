set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
setlocal nofoldenable

" Use php syntax check when doing :make
setlocal makeprg=cmake\ --build\ ../build\ -j\ 9


" Enhanced keyboard mappings
" In order to do this I go to console and run sed -n l (you can also use cat for it). Then I press ALT+J and see that
" the chars on the screen are ^[j .
" I replace ^[ with \e (because that's what is sent by my terminal when I press esc) and the final string for me is \ej.
execute "set <M-o>=\eo"
nnoremap <M-o> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>


" Include paths
if has('win32') || has('win64')
  set path+=C:/gcc/include/c++/4.5.0;C:/gcc/i386-pc-mingw32/include
else
  set path+=/usr/local/include;/usr/include

endif
