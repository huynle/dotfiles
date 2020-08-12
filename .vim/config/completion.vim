" HELP with `:help ins-completion`

" bind K to grep word under cursor
nnoremap gr :grep <cword> *<CR>
nnoremap Gr :grep <cword> %:p:h/*<CR>
nnoremap gR :grep '\b<cword>\b' *<CR>
nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>

" vnoremap <silent> GR :grep <SID>GetVisualSelection() %:p:h/*<CR>

"""" popup control
" inoremap <expr> <c-j> ((pumvisible())?("\<C-n>"):("j"))
" inoremap <expr> <c-k> ((pumvisible())?("\<C-p>"):("k"))

set conceallevel=2
set concealcursor=vin
" set completeopt=menu,preview
  

" {{{ MUcomplete and clang_Complete goes together

let g:mucomplete#enable_auto_at_startup = 0
set complete-=i
set complete-=t
set noinfercase
" The following line assumes `brew install llvm` in macOS
" let g:clang_user_options =  '-std=c++14'
" let g:mucomplete#completion_delay=200
" or else, cscope wont work, because it takes over c-]
let g:mucomplete#no_mappings = 1
" let g:mucomplete#popup_direction = { 'path' : -1, 'c-p': 1 }
imap <c-j> <plug>(MUcompleteFwd)
imap <c-k> <plug>(MUcompleteBwd)
" allow us to press enter on completion
imap <expr> <cr> pumvisible() ? "<c-y>" : "<CR>"

" toggling complete option with Mu Completion on/off
fun! ToggleCompleteopt()
  MUcompleteAutoToggle
  if exists('#MUcompleteAuto')
    " Settings for automatic completion
    set completeopt=menuone
  else
    " Settings for manual completion
    set completeopt=menu
  endif
endf
" " close preview when finish
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" command! MyMUcompleteToggle call ToggleCompleteopt()
nnoremap <leader>cc :call ToggleCompleteopt()<CR>

""" MORE custom completion
" let s:spl_cond = { t -> &l:spelllang == 'en' && t =~# '\a\{4}$' }
" let s:cpp_cond = { t -> t =~# '\%(->\|::\)$' }
" let g:mucomplete#can_complete = {}
" let g:mucomplete#can_complete.default = { 'uspl': s:spl_cond }
" let g:mucomplete#can_complete.cpp     = { 'omni': s:cpp_cond }
" let g:mucomplete#chains = {
"       \ 'default' : ['path', 'omni', 'keyn', 'dict', 'uspl'],
"       \ 'vim'     : ['path', 'cmd', 'keyn']
"       \ }

"""" getting ultisnips to play nicely withth mucomplete

" " remap the tab
" let g:UltiSnipsExpandTrigger = "<f5>"        " Do not use <tab>
" let g:UltiSnipsJumpForwardTrigger = "<c-b>"  " Do not use <c-j>
" inoremap <silent> <expr> <plug>MyCR
"     \ mucomplete#ultisnips#expand_snippet("\<cr>")
" imap <cr> <plug>MyCR


"""""""""" supertab integrate with mucomplete
let g:SuperTabDefaultCompletionType=""
let g:SuperTabCrMapping=0


""""""""" Clang Complete Settings
" set omnifunc=ccomplete#Complete
" this sets clang_complete as the 'user completion" and not omnicompletion
set completefunc=ccomplete#Complete
" if there's an error, allow us to see it
let g:clang_complete_copen=1
"disable autocomplete
let g:clang_complete_auto = 0
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
" Limit memory use 
let g:clang_memory_percent=70
let g:clang_auto_select=0
" let g:clang_use_library=1
" let g:clang_library_path='/usr/lib64/llvm/libclang.so'
let g:clang_make_default_keymappings=0
" The single one that works with clang_complete
let g:clang_snippets_engine='ultisnips'
let g:clang_snippets=1
let g:clang_conceal_snippets=1

let g:clang_omnicppcomplete_compliance=1
""" ADDING IN OMNICPP completion to mucomplete?
let OmniCpp_SelectFirstItem = 0
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_ShowScopeInAbbr = 0
let OmniCpp_ShowPrototypeInAbbr = 0
let OmniCpp_ShowAccess = 1
let OmniCpp_DisplayMode = 0
" }}}

"""""""" tagging
" These tag generation run in the background
function! UpdateTags()
  " Update ctags
  call system('ctags -R . >> /dev/null 2>&1 &')
  " call system('ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . >> /dev/null 2>&1 &')
endfunction

function! UpdateCscope()
  " Update cscope
  call system('. $HOME/.vim/scripts/gencscope 2>&1 &')
endfunction

"""""" SUPERTAB
" let g:SuperTabDefaultCompletionType=""
" let g:SuperTabDefaultCompletionType='<c-x><c-o><c-p>'
" let g:clang_complete_auto=1


" """"" moving a line up and down --> use unimpaired
" " Not working for now 
" execute "set <M-j>=\ej"
" execute "set <M-k>=\ek"

" nnoremap <M-j> :m .+1<CR>==
" nnoremap <M-k> :m .-2<CR>==
" inoremap <M-j> <Esc>:m .+1<CR>==gi
" inoremap <M-k> <Esc>:m .-2<CR>==gi
" vnoremap <M-j> :m .+1<CR>gv=gv
" vnoremap <M-k> :m .-2<CR>gv=gv


" """""""""""" CSCOPE
let g:quickr_cscope_keymaps = 0
let g:quickr_cscope_autoload_db = 1
let g:quickr_cscope_use_qf_g = 0

nmap <c-\>s <plug>(quickr_cscope_symbols)
nmap <c-\>g <plug>(quickr_cscope_global)
nmap <c-\>c <plug>(quickr_cscope_callers)
nmap <c-\>f <plug>(quickr_cscope_files)
nmap <c-\>i <plug>(quickr_cscope_includes)
nmap <c-\>t <plug>(quickr_cscope_text)
nmap <c-\>e <plug>(quickr_cscope_egrep)
nmap <c-\>d <plug>(quickr_cscope_functions)


" This is only availale in the quickfix window, owing to the filetype
" restriction on the autocmd (see below).
function! <SID>OpenQuickfix(new_split_cmd)
  " 1. the current line is the result idx as we are in the quickfix
  let l:qf_idx = line('.')
  " 2. jump to the previous window
  wincmd p
  " 3. switch to a new split (the new_split_cmd will be 'vnew' or 'split')
  execute a:new_split_cmd
  " 4. open the 'current' item of the quickfix list in the newly created buffer
  "    (the current means, the one focused before switching to the new buffer)
  execute l:qf_idx . 'cc'
  execute "cclose"
endfunction


