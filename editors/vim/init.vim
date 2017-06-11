if &compatible
  set nocompatible
endif

" #############################
" In your .vimrc.before.local file
" list only the plugin groups you will use
if !exists('g:plug_groups')
	" let g:plug_groups=['general', 'writing', 'formatting', 'programming', 'python', 'go', 'autocomplete', 'visual']

  let g:plug_groups=['general', 'visual', 'formatting', 'programming', 'autocomplete', 'go', 'snippets', 'markdown', 'writing']
endif


if filereadable(expand("~/.vim/plug.vim"))
  source ~/.vim/plug.vim
endif


" Setup dein  ---------------------------------------------------------------{{{
  if (!isdirectory(expand("$HOME/.vim/dein/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.vim/dein/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.vim/dein/repos/github.com/Shougo/dein.vim"))
  endif

  set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim/

  call dein#begin(expand('~/.vim/dein')) " plugins' root path
  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')
  call dein#add('Shougo/unite.vim')

  " General Programming ---------------------------------------------------{{{
    call dein#add('neomake/neomake', {'on_cmd': 'Neomake'})
    call dein#add('tomtom/tcomment_vim')
    call dein#add('sbdchd/neoformat')
    call dein#add('janko-m/vim-test')
  " }}}

  " Specific Lang Format/Linting --------------------------------------------{{{

    " Python specific autocompletion
    call dein#add('tmhedberg/SimpylFold', {'on_ft': 'python'})
    call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'})
    call dein#add('zchee/deoplete-jedi')

    " Golang specific autocompletion
    call dein#add('zchee/nvim-go', {'build': 'gb build', 'on_ft': 'go'})
    call dein#add('zchee/deoplete-go')
    call dein#add('fatih/vim-go')

  " }}}

  " Easier Editor ----------------------------------------------------------{{{
    " use `cs'"` to 'change surround single qoute to double'
    call dein#add('tpope/vim-surround')

  " }}}

  " Extra Features ----------------------------------------------------------{{{
    call dein#add('mattn/webapi-vim')
    call dein#add('mattn/gist-vim')
    call dein#add('tpope/vim-fugitive')

    call dein#add('junegunn/fzf', { 'build': '~/.fzf/install --all', 'merged': 0 })
    call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  " }}}

  " Deoplete Stuff ----------------------------------------------------------{{{
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/denite.nvim')
  " }}}

  " Color/themes/schemes-----------------------------------------------------{{{
    call dein#add('rakr/vim-one')
  " }}}

  " dein closeout runs ------------------------------------------------------{{{
  if dein#check_install()
    call dein#install()
    let pluginsExist=1
  endif

  call dein#end()
  filetype plugin indent on
  " }}}

" }}}



" System Settings  ----------------------------------------------------------{{{
  set list listchars=tab:»·,trail:·,nbsp:·
  set ignorecase                      " Ignorecasspf13_no_restore_cursore searches
  set noswapfile
  set autoread                        " detect when a file is changed
  " set autoindent
  set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
  set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
  set virtualedit=onemore             " Allow for cursor beyond last character
  set history=1000                    " Store a ton of history (default is 20)
  set ignorecase                      " Case insensitive search
  set smartcase                       " Case sensitive when uc present
  set wildmenu                        " Show list instead of just completing
  set wildmode=list:longest,full      " Command <Tab> completion, list matches, then longest common part, then all.
  set whichwrap=b,s,h,l,<,>,[,]       " Backspace and cursor keys wrap too set spell                               " Spell checking on
  set number                          " setting line numbers
  set numberwidth=1                   " setting width of line

" helpers for dealing with other people's code
  nmap \t :set ts=2 sts=2 sw=2 noet<cr>
  nmap \s :set ts=2 sts=2 sw=2 et<cr>
  set tabstop=2 shiftwidth=2 expandtab


" Reduce the wait time for vim to switch from insert to normal to visual
  set timeoutlen=1000 ttimeoutlen=10

" Setting up the directories
  set backup                      " Backups are nice ...
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
  set undodir="$HOME/.VIM_UNDO_FILES"

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
  let g:is_posix = 1

" set for truecolors
  set termguicolors

" Remember cursor position between vim sessions
autocmd BufReadPost *
          \ if line("'\"") > 0 && line ("'\"") <= line("$") |
          \   exe "normal! g'\"" |
          \ endif
          " center buffer around cursor when opening files
autocmd BufRead * normal zz

"}}}"

" System mappings  ----------------------------------------------------------{{{

" No need for ex mode
  nnoremap Q <nop>
  vnoremap // y/<C-R>"<CR>
" exit insert, dd line, enter insert
  inoremap <c-d> <esc>ddi
" Navigate between display lines
  noremap  <silent> <Up>   gk
  noremap  <silent> <Down> gj
  noremap  <silent> k gk
  noremap  <silent> j gj
  noremap  <silent> <Home> g<Home>
  noremap  <silent> <End>  g<End>
  inoremap <silent> <Home> <C-o>g<Home>
  inoremap <silent> <End>  <C-o>g<End>
" force to use homerow instead of arrow for navi
  nnoremap <Left> :echoe "Use h"<CR>
  nnoremap <Right> :echoe "Use l"<CR>
  nnoremap <Up> :echoe "Use k"<CR>
  nnoremap <Down> :echoe "Use j"<CR>
" exit insert, dd line, enter insert
  inoremap <c-d> <esc>ddi
  noremap H ^
  noremap L g_
  noremap J 5j
  noremap K 5k
" Quicker window movement
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-h> <C-w>h
  nnoremap <C-l> <C-w>l
" Wrapped lines goes down/up to next row, rather than next line in file.
  noremap j gj
  noremap k gk
" Visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv

" fast saving
  nmap <leader>w :w!<cr>

" search highlighting
  map <space> /
  map <c-space> ?
  nnoremap <silent> <esc> :noh<cr>                " clear search highlighting

" working with tabs
  map <leader>tn :tabnew<cr>
  map <leader>to :tabonly<cr>
  map <leader>tc :tabclose<cr>
  map <leader>tm :tabmove

" Neovim terminal mapping
" terminal 'normal mode'
  tmap <esc> <c-\><c-n><esc><cr>

" Switch current directory
  map <leader>cd :cd %:p:h<cr>:pwd<cr>

" open buffer for scribling
  map <leader>q :e ~/buffer<cr>

" paste mode, useful for pasting other chunk of code
  map <leader>pp :setlocal paste!<cr>

" wipout buffer
  nmap <silent> <leader>b :bw<cr>

" Close current buffer
  map <leader>bd :Bclose<cr>

" Close all buffers
  map <leader>ba :1,1000 bd!<cr>

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
  vnoremap . :normal .<CR>

" For when you forget to sudo.. Really Write the file.
  cmap w!! w !sudo tee % >/dev/null

" swapping ; to allow command to enter
  nnoremap ; :

" Switch between the last two files
  nnoremap <leader><leader> <c-^>
  imap <C-\> <C-w>                          " Delete a word, sub for ctrl+bs

  set backspace=indent,eol,start            " Backspace for dummies
  nnoremap <F5> :source ~/.vim/init.vim<CR> " reload vimrc file

" Open new split panes to right and bottom, which feels more natural
  set splitbelow
  set splitright

"}}}"

" Themes, Commands, etc  ----------------------------------------------------{{{
  syntax on
  execute "set background=".$BACKGROUND
  execute "colorscheme ".$THEME
"}}}

" Code formatting -----------------------------------------------------------{{{

" ,f to format code, requires formatters: read the docs
  noremap <silent> <leader>f :Neoformat<CR>

" typical comment mapping
  vnoremap <c-/> :TComment<cr>

" }}}

" Deoplete ------------------------------------------------------------------{{{

" enable deoplete
  let g:deoplete#enable_at_startup = 1
  let g:echodoc_enable_at_startup=1

  " if !exists('g:deoplete#omni#input_patterns')
  "   let g:deoplete#omni#input_patterns = {}
  " endif

  " let g:deoplete#disable_auto_complete = 0 " dropdown autocomplete

" Close the documentation window when completion is done
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
  autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" close the preview window when you're not using it
  " let g:SuperTabClosePreviewOnPopupClose = 1


  " inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  " inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  " function! s:my_cr_function()
  "   return pumvisible() ? deoplete#mappings#close_popup() : "\n"
  "endfunction

" " deoplete-clang
  " let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
  " let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'

" deoplete-jedi
  let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
  let g:deoplete#sources#jedi#enable_cache = 1
  let g:deoplete#auto_completion_start_length = 1

" deoplete-go
  let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
  let g:deoplete#sources#go#use_cache = 1
  let g:go_fmt_command = 'goimports'
  let g:deoplete#sources#go = 'vim-go'

"}}}"

" Denite --------------------------------------------------------------------{{{

nnoremap <silent> <leader>c :Denite colorscheme<CR>

"}}}"

" Fold, gets it's own section  ----------------------------------------------{{{

" Custom folding function
  function! MyFoldText() " {{{
      let line = getline(v:foldstart)
      let nucolwidth = &fdc + &number * &numberwidth
      let windowwidth = winwidth(0) - nucolwidth - 3
      let foldedlinecount = v:foldend - v:foldstart

      " expand tabs into spaces
      let onetab = strpart('          ', 0, &tabstop)
      let line = substitute(line, '\t', onetab, 'g')

      let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
      " let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - len('lines')
      " let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - len('lines   ')
      let fillcharcount = windowwidth - len(line)
      " return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . ' Lines'
      return line . '…' . repeat(" ",fillcharcount)
  endfunction " }}}

  set foldtext=MyFoldText()

" Saving spot for folding
  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

  set foldlevel=99                                " Dont fold if not specified for filetype below

" Space to toggle folds.
  nnoremap <Space> za
  vnoremap <Space> za

" Working with vim file
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal fdc=1
  autocmd FileType vim setlocal foldlevel=0

" Setting automatic folder per file type
  autocmd FileType python setl foldmethod=syntax


"}}}"

" Linting -------------------------------------------------------------------{{{

  autocmd! BufWritePost * Neomake
  let g:neomake_warning_sign = {'text': '•'}
  let g:neomake_error_sign = {'text': '•'}
  let g:neomake_open_list = 2
"}}}

" Need Fixing ---------------------------------------------------------------{{{

" ######################### Normal mode mapping
  nmap <F8> :TagbarToggle<CR>

  " Opens a new tab with the current buffer's path
  " Super useful when editing files in the same directory
  map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/


  " vim-sneak for moving around, defaul use 's{char}{char}"', use `;` to go next and and `` or ctrl-o to go back to starting
  map f <Plug>Sneak_s
  map F <Plug>Sneak_S


" ############################ Visual Mode Mapping


" ################################ General  Vim Custom Mapping


  " Code folding options
"   nmap <leader>0 :set foldlevel=0<CR>
"   nmap <leader>1 :set foldlevel=1<CR>
"   nmap <leader>2 :set foldlevel=2<CR>
"   nmap <leader>3 :set foldlevel=3<CR>
"   nmap <leader>4 :set foldlevel=4<CR>
"   nmap <leader>5 :set foldlevel=5<CR>
"   nmap <leader>6 :set foldlevel=6<CR>
"   nmap <leader>7 :set foldlevel=7<CR>
"   nmap <leader>8 :set foldlevel=8<CR>
"   nmap <leader>9 :set foldlevel=9<CR>



  let g:spf13_no_wrapRelMotion = 1
  if !exists('g:spf13_no_wrapRelMotion')
     " Same for 0, home, end, etc
     function! WrapRelativeMotion(key, ...)
         let vis_sel=""
         if a:0
             let vis_sel="gv"
         endif
         if &wrap
             execute "normal!" vis_sel . "g" . a:key
         else
             execute "normal!" vis_sel . a:key
         endif
     endfunction

     " Map g* keys in Normal, Operator-pending, and Visual+select
     noremap $ :call WrapRelativeMotion("$")<CR>
     noremap <End> :call WrapRelativeMotion("$")<CR>
     noremap 0 :call WrapRelativeMotion("0")<CR>
     noremap <Home> :call WrapRelativeMotion("0")<CR>
     noremap ^ :call WrapRelativeMotion("^")<CR>
     " Overwrite the operator pending $/<End> mappings from above
     " to force inclusive motion with :execute normal!
     onoremap $ v:call WrapRelativeMotion("$")<CR>
     onoremap <End> v:call WrapRelativeMotion("$")<CR>
     " Overwrite the Visual+select mode mappings from above
     " to ensure the correct vis_sel flag is passed to function
     vnoremap $ :<C-U>call WrapRelativeMotion("$", 1)<CR>
     vnoremap <End> :<C-U>call WrapRelativeMotion("$", 1)<CR>
     vnoremap 0 :<C-U>call WrapRelativeMotion("0", 1)<CR>
     vnoremap <Home> :<C-U>call WrapRelativeMotion("0", 1)<CR>
     vnoremap ^ :<C-U>call WrapRelativeMotion("^", 1)<CR>
  endif

  " Map <Leader>ff to display all lines with keyword under cursor, this may be done already?
  nmap <leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>


" #############################
set backup                  " Backups are nice ...
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

let g:python3_host_prog = '/home/hle/.virtualenvs/nvim/bin/python3'

let mapleader = ","


" ################################### Vim Behavior on command


" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])



" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif


if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif


" ######################### Niknisi copy
" file type specific settings
augroup configgroup
    autocmd!

    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='
    autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
    autocmd BufWritePost .vimrc.local source %
    " save all files on focus lost, ignoring warnings about untitled buffers
    autocmd FocusLost * silent! wa

    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']

augroup END



" #################################### Vim visual
function! ToggleBG()                    " Allow to trigger background
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction
noremap <leader>bg :call ToggleBG()<CR>



" ############################### Editor




" ####################################### Navigation

" nnoremap <C-n> :e .<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4 "open files in the previous window
let g:netrw_altv = 1
let g:netrw_winsize = 20
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" Netrw settings to looklike nerdtree
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-n> :call ToggleVExplorer()<CR>
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Change directory to the current buffer when opening files.
set autochdir

" #################################### Plugin settings

" Plugins {

    " GoLang {
      if count(g:plug_groups, 'go')
          let g:go_highlight_functions = 1
          let g:go_highlight_methods = 1
          let g:go_highlight_structs = 1
          let g:go_highlight_operators = 1
          let g:go_highlight_build_constraints = 1
          let g:go_fmt_command = "goimports"
          let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
          let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
          au FileType go nmap <Leader>s <Plug>(go-implements)
          au FileType go nmap <Leader>i <Plug>(go-info)
          au FileType go nmap <Leader>e <Plug>(go-rename)
          au FileType go nmap <leader>r <Plug>(go-run)
          au FileType go nmap <leader>b <Plug>(go-build)
          au FileType go nmap <leader>t <Plug>(go-test)
          au FileType go nmap <Leader>gd <Plug>(go-doc)
          au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
          au FileType go nmap <leader>co <Plug>(go-coverage)
      endif
    " }

    " Python {
      if count(g:plug_groups, 'python')
        let g:pymode_python = 'python3'
        let g:pymode_doc = 0
        let g:pymode_folding = 0          " disable code folding
        let g:pymode_virtualenv = 1       " use virtualenvs
        let g:pymode_virtualenv_path = $VIRTUAL_ENV    " use tmuxinator to set the enviornment

      endif
      " }

    " Fugitive {
        if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
          nnoremap <silent> <leader>gs :Gstatus<CR>
          nnoremap <silent> <leader>gd :Gdiff<CR>
          nnoremap <silent> <leader>gc :Gcommit<CR>
          nnoremap <silent> <leader>gb :Gblame<CR>
          nnoremap <silent> <leader>gl :Glog<CR>
          nnoremap <silent> <leader>gp :Git push<CR>
          nnoremap <silent> <leader>gr :Gread<CR>
          nnoremap <silent> <leader>gw :Gwrite<CR>
          nnoremap <silent> <leader>ge :Gedit<CR>
          " Mnemonic _i_nteractive
          nnoremap <silent> <leader>gi :Git add -p %<CR>
          nnoremap <silent> <leader>gg :SignifyToggle<CR>
        endif
      "}

    " vim-airline {
      " Set configuration options for the statusline plugin vim-airline.
      " Use the powerline theme and optionally enable powerline symbols.
      " To use the symbols , , , , , , and .in the statusline
      " segments add the following to your .vimrc.before.local file:
      "   let g:airline_powerline_fonts=1
      " If the previous symbols do not render for you then install a
      " powerline enabled font.

      " See `:echo g:airline_theme_map` for some more choices
      " Default in terminal vim is 'dark'

      if isdirectory(expand("~/.vim/plugged/vim-airline-themes/"))
          if !exists('g:airline_theme')
              " let g:airline_theme = 'solarized'
              execute "let g:airline_theme=""'".$THEME."'"
              let g:airline#extensions#tabline#enabled = 1          " Leave this to show tab at the top
              let g:airline#extensions#tabline#show_buffers = 0
          endif
          if !exists('g:airline_powerline_fonts')
              " Use the default set of separators with a few customizations
              let g:airline_left_sep='›'  " Slightly fancier than '>'
              let g:airline_right_sep='‹' " Slightly fancier than '<'
          endif
      endif

    " }

    " UltiSnips config {
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<tab>"
        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
        " inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    " }

    " Deoplete {


    " }

    " FZF {
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

      nnoremap <silent> <leader>K :call SearchWordWithAg()<CR>
      vnoremap <silent> <leader>K :call SearchVisualSelectionWithAg()<CR>
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
      command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args
    " }

    " Vim-test {
      nmap <silent> <leader>t :TestNearest<CR>
      nmap <silent> <leader>T :TestFile<CR>
      nmap <silent> <leader>a :TestSuite<CR>
      nmap <silent> <leader>l :TestLast<CR>
      nmap <silent> <leader>g :TestVisit<CR>
    " }

    " Vim-markdown {
      " set conceallevel=2
      " let g:vim_markdown_folding_disabled = 1
      " let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
      " let g:markdown_fenced_languages = ['javascript', 'ruby', 'sh', 'yaml', 'javascript', 'html', 'vim', 'coffee', 'json', 'diff']
      " let g:vim_markdown_frontmatter = 1
      " let g:vim_markdown_toml_frontmatter = 1
      " let g:vim_markdown_new_list_item_indent = 2
    " }

" #################################### Run other Vim setup files

" source all .vimrc files inside of the zsh/ directory
for f in split(glob('~/.dotfiles/editors/vim/**/*.vimrc'), '\n')
    exe 'source' f
endfor

" Local config
if filereadable($HOME . "~/.vimrc.local")
  source ~/.vimrc.local
endif

" }}}
