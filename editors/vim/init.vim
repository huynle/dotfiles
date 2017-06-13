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


let g:python3_host_prog = '/home/hle/.virtualenvs/nvim/bin/python3'

" Setup dein  ---------------------------------------------------------------{{{
  if (!isdirectory(expand("$HOME/.vim/dein/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.vim/dein/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.vim/dein/repos/github.com/Shougo/dein.vim"))
  endif

  set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim/

  call dein#begin(expand('~/.vim/dein')) " plugins' root path
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')
  call dein#add('Shougo/unite.vim')

  " Utilities  ----------------------------------------------------{{{

    call dein#add('tomtom/tlib_vim')
    call dein#add('tpope/vim-repeat') " enables repeating other supported plugins with the . command
    call dein#add('sickill/vim-pasta') " context-aware pasting
    
    if executable('ag')
      call dein#add('mileszs/ack.vim')
      let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
    endif

  "}}}

  " General Programming ---------------------------------------------------{{{
    call dein#add('neomake/neomake', {'on_cmd': 'Neomake'})
    call dein#add('tomtom/tcomment_vim')
    call dein#add('sbdchd/neoformat')
    call dein#add('janko-m/vim-test')

    if executable('ctags')
      call dein#add('majutsushi/tagbar')
    endif

  " }}}

  " specific lang format/linting --------------------------------------------{{{

    " call dein#add('SirVer/ultisnips' ,  {'on_map' : { 'i' : ['<TAB>'] }})
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('honza/vim-snippets')
    
    " python specific autocompletion
    " call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'})
    call dein#add('zchee/deoplete-jedi', {'on_ft': 'python'})
    call dein#add('yssource/python.vim', {'on_ft': 'python'})
    
    " golang specific autocompletion
    " call dein#add('zchee/nvim-go', {'build': 'gb build', 'on_ft': 'go'})
    " call dein#add('zchee/nvim-go', {'build': 'make'})
    call dein#add('zchee/deoplete-go', {'on_ft': 'go'})
    call dein#add('fatih/vim-go', {'on_ft': 'go'})

    " markdown
    call dein#add('tpope/vim-markdown', { 'on_ft': 'markdown' })
    call dein#add('wavded/vim-stylus', { 'on_ft': 'markdown'}) " markdown support
  
  " }}}

  " Easier Editor ----------------------------------------------------------{{{
    " use `cs'"` to 'change surround single qoute to double'
    call dein#add('tpope/vim-surround', {'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'}, 'depends' : 'vim-repeat'})
    call dein#add('easymotion/vim-easymotion')  " use <leader><leader>e or b to invoke
    call dein#add('justinmk/vim-sneak')  " use s{char}{char} to invoke, remapped to f

    " call dein#add('ervandew/supertab') " Perform all your vim insert mode completions with
  " }}}

  " Extra Features ----------------------------------------------------------{{{
    call dein#add('mattn/webapi-vim')
    call dein#add('mattn/gist-vim')
    call dein#add('tpope/vim-fugitive', { 'on_cmd': [ 'Git', 'Gstatus', 'Gwrite', 'Glog', 'Gcommit', 'Gblame', 'Ggrep', 'Gdiff', ] })

    call dein#add('jiangmiao/auto-pairs')

    call dein#add('junegunn/fzf', { 'build': '~/.fzf/install --all', 'merged': 0 })
    call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  " }}}
  
  " Writing -----------------------------------------------------------------{{{
    call dein#add('reedes/vim-wordy')
    call dein#add('reedes/vim-litecorrect')
    call dein#add('reedes/vim-textobj-sentence')
    call dein#add('reedes/vim-textobj-quote')
  "  }}}

  " Deoplete Stuff ----------------------------------------------------------{{{
    call dein#add('Shougo/deoplete.nvim')
    " call dein#add('Shougo/denite.nvim')
  " }}}

  " Color/visual/themes/schemes ---------------------------------------------{{{
    call dein#add('rakr/vim-one')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
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
  let mapleader = ","

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
  set whichwrap=b,s,h,l,<,>,[,]       " Backspace and cursor keys wrap too set spell
  set spell                           " Spell checking on
  set number                          " setting line numbers
  set numberwidth=1                   " setting width of line

  set autochdir
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
  
  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


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

" System Mappings  ----------------------------------------------------------{{{

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

" fast save
  nmap <leader>w :w!<cr>

" search highlighting
  " map <space> 
  map <c-space> /
  nnoremap <silent> <esc> :noh<cr>                " clear search highlighting

" working with tabs
  nnoremap th  :tabfirst<CR>
  nnoremap tj  :tabprev<CR>
  nnoremap tk  :tabnext<CR>
  nnoremap tl  :tablast<CR>
  nnoremap tt  :tabedit<Space>
  nnoremap tn  :tabnext<Space>
  nnoremap tm  :tabm<Space>
  nnoremap td  :tabclose<CR>
  " Opens a new tab with the current buffer's path
  " Super useful when editing files in the same directory
  nnoremap te :tabedit <c-r>=expand("%:p:h")<cr>/


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
  imap <BS> <C-w>
  imap <C-del> <C-w>
  " noremap! <C-h> <C-w>
  " inoremap <C-w> <C-\><C-o>dB
  " inoremap <C-BS> <C-\><C-o>db

" famous ctrl-backspace
  " nmap <C-BS> :echo "foo"

  set backspace=indent,eol,start            " Allow backspace to delete through multiple lines
  nnoremap <F5> :source ~/.vim/init.vim<CR> " reload vimrc file

" Open new split panes to right and bottom, which feels more natural
  set splitbelow
  set splitright

"}}}"

" Editor Settings  ----------------------------------------------------------{{{

  " " UltiSnips ---------------------------------------------------------------{{{
  "     let g:UltiSnipsExpandTrigger="<tab>"
  "     let g:UltiSnipsJumpForwardTrigger="<tab>"
  "     let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
  "     " inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  " " }}}

  " Netrw -------------------------------------------------------------------{{{
    " nnoremap <C-n> :e .<CR>
    let g:netrw_banner = 0
    let g:netrw_liststyle = 3
    let g:netrw_browse_split = 4 "open files in the previous window
    let g:netrw_altv = 1
    let g:netrw_winsize = 20

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
  "}}}

  " Fugitive ----------------------------------------------------------------{{{
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
    "}}}

  " Denite --------------------------------------------------------------------{{{
    " nnoremap <silent> <leader>c :Denite colorscheme<CR>
  "}}}"
  "
  " Fold, gets it's own section  ----------------------------------------------{{{

    call dein#add('tmhedberg/SimpylFold', {'on_ft': 'python'})
    call dein#add('nelstrom/vim-markdown-folding', {'on_ft': 'markdown'})

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
  "}}}

  " Ignore Files/Folders ----------------------------------------------------{{{
    set wildignore+=node_modules
    set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*.beam
    set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.ico
    set wildignore+=.sass-cache,.DS_Store,.bundle
    set wildignore+=.coffee.js
    set wildignore+=*.rbc,*.scssc,*.sassc
    set wildignore+=*/spec/dummy/*
    set wildignore+=*/tmp/*
  "  }}}
"}}}

" Extra Tools Settings ------------------------------------------------------{{{
  " Vim-test {
    nmap <silent> <leader>t :TestNearest<CR>
    nmap <silent> <leader>T :TestFile<CR>
    nmap <silent> <leader>a :TestSuite<CR>
    nmap <silent> <leader>l :TestLast<CR>
    nmap <silent> <leader>g :TestVisit<CR>
  " }

" }}}

" Themes, Visual, etc  ------------------------------------------------------{{{
  syntax on
  execute "set background=".$BACKGROUND
  execute "colorscheme ".$THEME
  
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

  if isdirectory(expand("~/.vim/dein/repos/github.com/vim-airline/vim-airline-themes"))
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

"}}}

" Code formatting -----------------------------------------------------------{{{
  " automatic pairing of bracket, quotes, etc...

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


  " SuperTab like snippets behavior --------------------------------------------{{{
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>" 
  "}}}

"}}}

" Language Specifics---------------------------------------------------------{{{
  " Markdown ----------------------------------------------------------------{{{
    " make frontmatter comment and do coloring
    au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
    au FileType markdown setlocal textwidth=100

    let g:markdown_fenced_languages = ['javascript', 'ruby', 'sh', 'yaml', 'javascript', 'html', 'vim', 'json', 'diff']
  " }}}
  
  " GoLang-------------------------------------------------------------------{{{
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
  " }}}

  " Python ------------------------------------------------------------------{{{
    if count(g:plug_groups, 'python')
      let g:pymode_python = 'python3'
      let g:pymode_doc = 0
      let g:pymode_folding = 0          " disable code folding
      let g:pymode_virtualenv = 1       " use virtualenvs
      let g:pymode_virtualenv_path = $VIRTUAL_ENV    " use tmuxinator to set the enviornment

    endif
    " }}}

"  }}}

" Search --------------------------------------------------------------------{{{
    
  " vim-sneak for moving around, defaul use 's{char}{char}"', use `;` to go next and and `` or ctrl-o to go back to starting
  map f <Plug>Sneak_s
  map F <Plug>Sneak_S

  let g:fzf_nvim_statusline = 0 " disable statusline overwriting
  let g:fzf_layout = { 'down': '~15%' }

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
  command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args)

  " Special mapping for fzf
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


  " }
"}}}

" Linting -------------------------------------------------------------------{{{

  autocmd! BufWritePost * Neomake
  let g:neomake_warning_sign = {'text': '•'}
  let g:neomake_error_sign = {'text': '•'}
  let g:neomake_open_list = 2
"}}}

" Need Fixing --------------- ------------------------------------------------{{{

" ######################### Normal mode mapping
  nmap <F8> :TagbarToggle<CR>


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
