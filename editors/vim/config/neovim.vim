
" Write history on idle
autocmd MyAutoCmd CursorHold * if exists(':rshada') | rshada | wshada | endif

" Search and use environments specifically made for Neovim.
if isdirectory($VARPATH.'/venv/neovim2')
	let g:python_host_prog = $VARPATH.'/venv/neovim2/bin/python'
endif

if isdirectory($VARPATH.'/venv/neovim3')
	" let g:python3_host_prog = $VARPATH.'/venv/neovim3/bin/python'
  let g:python3_host_prog = '/home/hle/.virtualenvs/nvim/bin/python3'
endif
