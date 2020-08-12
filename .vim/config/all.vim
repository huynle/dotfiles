"" for plugin specific configurations 


if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
  nmap <Leader>a/ :Tabularize /\/\/<CR>
  vmap <Leader>a/ :Tabularize /\/\/<CR>
endif

" EasyMotion
nmap ss <Plug>(easymotion-s2)
nmap sd <Plug>(easymotion-s)
nmap sf <Plug>(easymotion-overwin-f)
map  sh <Plug>(easymotion-linebackward)
map  sl <Plug>(easymotion-lineforward)
" map  sj <Plug>(easymotion-j)
" map  sk <Plug>(easymotion-k)
map  s/ <Plug>(easymotion-sn)
omap s/ <Plug>(easymotion-tn)
map  sn <Plug>(easymotion-next)
map  sp <Plug>(easymotion-prev)

""""""""""""" Localvimrc
let g:localvimrc_enable = 1
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0
let g:localvimrc_event = [ "BufRead", "BufWrite"]
let g:localvimrc_name = [ "$PROJECTCONFIG/config.vim", "$PROJECTCONFIG/local.vim" ]

""""""""""""" NERDTree
let g:NERDTreeMapOpenSplit = 'sg'
let g:NERDTreeMapOpenVSplit = 'sv'
let g:NERDTreeMapOpenInTab = 'st'
let g:NERDTreeMapOpenInTabSilent = 'sT'
let g:NERDTreeMapUpdirKeepOpen = '<BS>'
let g:NERDTreeMapOpenRecursively = 't'
let g:NERDTreeMapCloseChildren = 'T'
let g:NERDTreeMapToggleHidden = '.'

let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 25
let g:NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeAutoDeleteBuffer = 0
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeBookmarksFile = $VARPATH.'/treemarks'
let NERDTreeIgnore = [
	\ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.svn$',
	\ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.cache$'
	\ ]

nnoremap <silent> <LocalLeader>e :<C-u>NERDTreeToggle<CR>
nnoremap <silent> <LocalLeader>a :<C-u>NERDTreeFind<CR>


"""""""""""" Easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"""""""""""" Commentary
xmap <Leader>v  <Plug>Commentary
nmap <Leader>v  <Plug>CommentaryLine
xmap gc  <Plug>Commentary
nmap gc  <Plug>Commentary
omap gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine
nmap cgc <Plug>ChangeCommentary
nmap gcu <Plug>Commentary<Plug>Commentary

"""""""""""" CtrlP
let g:ctrlp_root_markers = ['$ROOT_MARKER', '.p4ignore']

" change defaults
let g:ctrlp_regexp = 1
let g:ctrlp_clear_cache_on_exit = 0
" let g:ctrlp_arg_map = 1 " allow for one extra argument when doing <c-o>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|lo|pyc|cpp)$',
  \ }

let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'

nnoremap <LocalLeader>b :CtrlPBuffer<CR>
nnoremap <LocalLeader>f :CtrlPCurWD<CR>
nnoremap <LocalLeader>t :CtrlPTag<cr>
nnoremap <LocalLeader>l :CtrlPLine<cr>
nnoremap <LocalLeader>o :CtrlPMRUFiles<cr>

let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<bs>', '<c-]>'],
  \ 'PrtDelete()':          ['<del>'],
  \ 'PrtDeleteWord()':      ['<c-w>'],
  \ 'PrtClear()':           ['<c-u>'],
  \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
  \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
  \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
  \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
  \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
  \ 'PrtHistory(-1)':       ['<c-n>'],
  \ 'PrtHistory(1)':        ['<c-p>'],
  \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
  \ 'AcceptSelection("t")': ['<c-t>'],
  \ 'AcceptSelection("v")': ['<c-v>', '<c-l>', '<RightMouse>'],
  \ 'ToggleFocus()':        ['<s-tab>'],
  \ 'ToggleRegex()':        ['<c-r>'],
  \ 'ToggleByFname()':      ['<c-d>'],
  \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
  \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
  \ 'PrtExpandDir()':       ['<tab>'],
  \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
  \ 'PrtInsert()':          ['<c-\>'],
  \ 'PrtCurStart()':        [],
  \ 'PrtCurEnd()':          [],
  \ 'PrtCurLeft()':         ['<left>', '<c-^>'],
  \ 'PrtCurRight()':        ['<right>'],
  \ 'PrtClearCache()':      ['<F5>'],
  \ 'PrtDeleteEnt()':       ['<F7>'],
  \ 'CreateNewFile()':      ['<c-y>'],
  \ 'MarkToOpen()':         ['<c-space>'],
  \ 'OpenMulti()':          ['<c-o>'],
  \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
  \ }



""""""""""" TAGBAR stuff
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>t  :TagbarOpen j<CR>
let g:tagbar_sort = 0
let g:tagbar_autofocus = 0
let g:tagbar_width = 30
let g:tagbar_autoclose = 0
let g:tagbar_expand=1
let g:tagbar_compact = 1
let g:tagbar_indent = 1



""""""""""" screenrc specific for copying and pasting
if exists("$BUFFERFILE")
  vnoremap <silent><leader>y :w! ~/.buffer<CR>
  " nnoremap <leader>y :'<,'>w! /home/e367212/.buffer<CR>
  " vnoremap <leader>y y :call writefile([getreg('0', 1)], "/home/e367212/.buffer")<CR>
  " vnoremap <leader>y :w! /home/e367212/.buffer
  nnoremap <silent><leader>p :.-1read ~/.buffer<CR>
  " vnoremap <silent><leader>p :'<,'>d|call read ~/.buffer<CR>
  xnoremap <leader>p "_d :.-2read ~/.buffer<CR>
endif
