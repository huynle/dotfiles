" File Types {{{
"-------------------------------------------------

augroup MyAutoCmd
  " Update filetype on save if empty
  autocmd BufWritePost *
        \ if &l:filetype ==# '' || exists('b:ftdetect')
        \ |   unlet! b:ftdetect
        \ |   filetype detect
        \ | endif

  " Check if file changed when its window is focus, more eager than 'autoread'
  autocmd FocusGained * :silent! !

  autocmd FileType python
    \ setlocal foldmethod=indent expandtab smarttab nosmartindent
    \ | setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80



	" " Disable paste and/or update diff when leaving insert mode
	" autocmd InsertLeave *
	" 			\ if &paste | setlocal nopaste mouse=a | echo 'nopaste' | endif |
	" 		  \ if &l:diff | diffupdate | endif

  " Automatically set read-only for files being edited elsewhere
	autocmd SwapExists * nested let v:swapchoice = 'o'

augroup END

" }}}

" vim: set ts=2 sw=2 tw=80 noet :
