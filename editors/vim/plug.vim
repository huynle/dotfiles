
" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute 'mkdir -p ~/.vim/plugged'
    execute 'mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif


" Remove declared plugins
function! s:UnPlug(plug_name)
  if has_key(g:plugs, a:plug_name)
    call remove(g:plugs, a:plug_name)
  endif
endfunction
command!  -nargs=1 UnPlug call s:UnPlug(<args>)

call plug#begin('~/.vim/plugged')

" ############## General
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
" Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
" Plug 'vim-scripts/tComment'
Plug 'tpope/vim-fugitive' " the ultimate git helper
Plug 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc sin visual mode

Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
"{{{
" Needed for deoplete completions
"}}}
"
Plug 'godlygeek/tabular'

Plug 'sickill/vim-pasta' " context-aware pasting

" ######################## Formatting

Plug 'sbdchd/neoformat'

Plug 'neomake/neomake' " neovim replacement for syntastic using neovim's job control functonality
"{{{
  autocmd! BufWritePost * Neomake
  let g:neomake_open_list = 2
"}}}



" Plug 'tomtom/tlib_vim' " utility functions for vim

" ################## Language Plugins
Plug 'fatih/vim-go'

Plug 'yssource/python.vim'
Plug 'klen/python-mode' " comprehensive python plugin
"{{{
  let g:pymode_python = 'python3'
"}}}



" ############## Vim visual

"
"
" ############## Code completions
Plug 'SirVer/ultisnips' " allow to include snippets
"{{{
  " UltiSnips config
  inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"}}}



Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"{{{
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#disable_auto_complete = 0 " dropdown autocomplete

  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return pumvisible() ? deoplete#mappings#close_popup() : "\n"
  endfunction

  " if has("gui_running")
  "     inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
  " else
  "     inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()
  " endif

  " Close the documentation window when completion is done
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

  " " deoplete-clang
  " let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
  " let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'

  Plug 'zchee/deoplete-jedi'
  "{{{
    " deoplete-jedi
    let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
    let g:deoplete#sources#jedi#enable_cache = 1
    let g:deoplete#auto_completion_start_length = 1
  " }}}"


  " " deoplete-go
  " let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  " let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
  " let g:deoplete#sources#go#use_cache = 1
  " let g:go_fmt_command = 'goimports'
  " let g:deoplete#sources#go = 'vim-go'

" }}}



Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting
  let g:fzf_layout = { 'down': '~15%' }

  nnoremap <silent> <C-p> :Files<CR>
  nnoremap <silent> <leader>b :Buffers<CR>
  nnoremap <silent> <leader>A :Windows<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>o :BTags<CR>
  nnoremap <silent> <leader>O :Tags<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
  nnoremap <silent> <leader>. :AgIn

  nnoremap <silent> K :call SearchWordWithAg()<CR>
  vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>
  nnoremap <silent> <leader>ft :Filetypes<CR>

  " Mapping selecting mappings
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)

  " Insert mode completion
  " Useful for completing hard to spell words
  " imap <c-x><c-k> <plug>(fzf-complete-word)
  inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '13%'})
  " Useful to add folder path
  imap <c-x><c-f> <plug>(fzf-complete-path)
  " Useful to FILE path
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  " Useful to add line that has been written before
  imap <c-x><c-l> <plug>(fzf-complete-line)


  function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction

  function! SearchWithAgInDirectory(...)
    call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
  endfunction
  command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
" }}}

" Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more


Plug 'janko-m/vim-test'
" {{{
  nmap <silent> <leader>t :TestNearest<CR>
  nmap <silent> <leader>T :TestFile<CR>
  nmap <silent> <leader>a :TestSuite<CR>
  nmap <silent> <leader>l :TestLast<CR>
  nmap <silent> <leader>g :TestVisit<CR>
" }}}


" markdown
" Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
" Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support

" ######### Vim as a text writer
Plug 'mattly/iterm-colors-pencil'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-textobj-quote'
Plug 'plasticboy/vim-markdown'
"{{{
  set conceallevel=2
  let g:vim_markdown_folding_disabled = 1
  " let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
  let g:markdown_fenced_languages = ['javascript', 'ruby', 'sh', 'yaml', 'javascript', 'html', 'vim', 'coffee', 'json', 'diff']
  let g:vim_markdown_frontmatter = 1
  let g:vim_markdown_toml_frontmatter = 1
  " let g:vim_markdown_new_list_item_indent = 2
 "}}}

Plug 'reedes/vim-pencil' " settings to allow vim to be used as a writer
" {{{
  function! Prose()
    " call pencil#init()
    " call lexical#init()
    " call litecorrect#init()
    " call textobj#quote#init()
    " call textobj#sentence#init()

    " manual reformatting shortcuts
    " nnoremap <buffer> <silent> Q gqap
    " xnoremap <buffer> <silent> Q gq
    " nnoremap <buffer> <silent> <leader>Q vapJgqap

    " force top correction on most recent misspelling
    " nnoremap <buffer> <c-s> [s1z=<c-o>
    " inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u

    " replace common punctuation
    " iabbrev <buffer> -- –
    " iabbrev <buffer> --- —
    " iabbrev <buffer> << «
    " iabbrev <buffer> >> »

    " open most folds
    setlocal foldlevel=6

    " replace typographical quotes (reedes/vim-textobj-quote)
    " map <silent> <buffer> <leader>qc <Plug>ReplaceWithCurly
    " map <silent> <buffer> <leader>qs <Plug>ReplaceWithStraight

    " highlight words (reedes/vim-wordy)
    noremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
    xnoremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
    inoremap <silent> <buffer> <F8> <C-o>:NextWordy<cr>

  endfunction

  " automatically initialize buffer by file type
  autocmd FileType markdown,mkd,text call Prose()

  " invoke manually by command for other file types
  command! -nargs=0 Prose call Prose()

  let g:airline_section_x = '%{PencilMode()}'
" }}}
" ################################

" Utilities
" Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons' " file drawer

" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'rakr/vim-one'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'



if filereadable(expand("~/.plug.vim.local"))
  source ~/.plug.vim.local
endif

call plug#end()
