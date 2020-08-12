setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal smarttab
setlocal nosmartindent
setlocal foldmethod=indent
setlocal previewheight=4

setlocal errorformat=%f:%l:%c:\ %m
setlocal errorformat+=%f:%l:\ %m
setlocal makeprg=flake8\ %

" setup per-project stuff:
"  - activate virtualenv (if there is one)
"  - set jedi's python version to match the project
"  - set flake8 executable for python
function! SetPythonEnv()
    " activate virtualenv (if there is one) - must be done first!
    let l:venv = fnamemodify(fnameescape(getcwd()), ':t')
    let l:venv_path = $WORKON_HOME . '/' . l:venv
    let l:venv_local = fnamemodify(getcwd(), ':p').'venv'

    if isdirectory(l:venv_local)
        echomsg 'Setting local python: ' . l:venv_local
        let g:virtualenv_directory = getcwd()
        call virtualenv#activate('venv')
        echomsg 'success setting virtualenv'
        " let l:run_cmd = 'source ' . 'l:venv_local' . 'bin/activate'
        " echomsg l:run_cmd
    elseif isdirectory(l:venv_path)
        echomsg 'Setting python from .virtualenv'
        call virtualenv#activate(l:venv)
    endif

"    " set jedi's python version to match the project
"    PythonJedi vim.command("let l:jedi_py_version = %s" % int(sys.version.split('.')[0]))
"    python vim.command("let l:venv_py_version = %s" % int(sys.version.split('.')[0]))
"    if l:jedi_py_version != l:venv_py_version
"        call jedi#force_py_version(l:venv_py_version)
"    endif
endfunction

" echom "got here to python plugin"

" augroup python_env
"     autocmd!
"     autocmd BufEnter * if &ft ==# 'python' | call SetPythonEnv() | endif
" augroup END
