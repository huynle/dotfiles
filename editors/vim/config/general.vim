
let g:python3_host_prog = '/home/hle/.virtualenvs/nvim/bin/python3'

  " Utilities  --------------------------------------------------------------{{{

    call dein#add('tomtom/tlib_vim')
    call dein#add('tpope/vim-repeat') " enables repeating other supported plugins with the . command
    call dein#add('sickill/vim-pasta') " context-aware pasting
    call dein#add('kassio/neoterm')
  "}}}

  " General Programming ---------------------------------------------------{{{
    call dein#add('janko-m/vim-test', { 'depends': "neoterm"})

    if executable('ctags')
      " call dein#add('majutsushi/tagbar')
"      call dein#add('craigemery/vim-autotag')
      " call dein#add('xolox/vim-misc')
      " call dein#add('xolox/vim-easytags', { 'depends': 'xolox/vim-misc'  })
    endif

  " }}}

  " Specific Lang format/linting --------------------------------------------{{{
    call dein#add('honza/vim-snippets')

    call dein#add('klen/python-mode', {'on_ft': ['python']})
    call dein#add('jmcantrell/vim-virtualenv')
    call dein#add('fisadev/vim-isort', {'autoload': {'filetypes': ['python']}})
  " }}}

  " Easier Editor ----------------------------------------------------------{{{
    call dein#add('tpope/vim-surround', {'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'}, 'depends' : 'vim-repeat'})
    call dein#add('justinmk/vim-sneak')
    " use s{char}{char} to invoke, remapped to f
  " }}}

  " Extra Features ----------------------------------------------------------{{{
    call dein#add('mattn/webapi-vim')
    call dein#add('mattn/gist-vim', { 'depends': 'webapi-vim' })
    call dein#add('tpope/vim-fugitive', { 'on_cmd': [ 'Git', 'Gstatus', 'Gwrite', 'Glog', 'Gcommit', 'Gblame', 'Ggrep', 'Gdiff', ] })

    " call dein#add('jiangmiao/auto-pairs')

    " call dein#add('junegunn/fzf', { 'build': '~/.fzf/install --all', 'merged': 0 })
    " call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  " }}}

  " Writing -----------------------------------------------------------------{{{
    call dein#add('reedes/vim-litecorrect')
    call dein#add('reedes/vim-textobj-sentence')
    call dein#add('reedes/vim-textobj-quote')
  "  }}}

  " Color/visual/themes/schemes ---------------------------------------------{{{
    " call dein#add('rakr/vim-one'" )
  " }}}

  " dein closeout runs ------------------------------------------------------{{{
  " if dein#check_install()
  "  call dein#install()
  "  let pluginsExist=1
  " endif

  " call dein#end()
  " filetype plugin indent on
  " }}}

" }}}








































" ######################################################### NEW CONFIG"

" General Settings
"---------------------------------------------------------
" General {{{
set mouse=nv                 " Disable mouse in command-line mode
set modeline                 " automatically setting options from modelines
set report=0                 " Don't report on line changes
set errorbells               " Trigger bell on error
set visualbell               " Use visual bell instead of beeping
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path=.,**                " Directories to search when using gf
set virtualedit=onemore      " Position cursor anywhere in visual block
set synmaxcol=1000           " Don't syntax highlight long lines
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
if has('patch-7.3.541')
	set formatoptions+=j       " Remove comment leader when joining lines
endif

if has('vim_starting')
	set encoding=utf-8
	scriptencoding utf-8
endif

" What to save for views:
set viewoptions-=options
set viewoptions+=slash,unix

" What to save in sessions:
set sessionoptions-=blank
set sessionoptions-=options
set sessionoptions-=globals
set sessionoptions-=folds
set sessionoptions-=help
set sessionoptions-=buffers
set sessionoptions+=tabpages

if ( ! has('nvim') || $DISPLAY !=? '') && has('clipboard')
	set clipboard& clipboard+=unnamedplus
endif

" }}}
" Wildmenu {{{
" --------
if has('wildmenu')
	set nowildmenu
	set wildmode=list:longest,full
	set wildoptions=tagfile
	set wildignorecase
	set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
	set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
	set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
	set wildignore+=__pycache__,*.egg-info

  set wildignore+=*.sw?                            " Vim swap files
  set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
  set wildignore+=*.luac                           " Lua byte code
  set wildignore+=*.jar                            " java archives
  set wildignore+=*.pyc                            " Python byte code
  set wildignore+=*.stats                          " Pylint stats

  set wildignore+=node_modules
  set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*.beam
  set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.ico
  set wildignore+=.sass-cache,.DS_Store,.bundle
  set wildignore+=.coffee.js
  set wildignore+=*.rbc,*.scssc,*.sassc
  set wildignore+=*/spec/dummy/*
  set wildignore+=*/tmp/*

endif

" }}}
" Vim Directories {{{
" ---------------
set undofile swapfile nobackup
set directory=$VARPATH/swap//,$VARPATH,~/tmp,/var/tmp,/tmp
set undodir=$VARPATH/undo//,$VARPATH,~/tmp,/var/tmp,/tmp
set backupdir=$VARPATH/backup/,$VARPATH,~/tmp,/var/tmp,/tmp
set viewdir=$VARPATH/view/
set nospell spellfile=$VIMPATH/spell/en.utf-8.add

" History saving
set history=2000
if has('nvim')
	"  ShaDa/viminfo:
	"   ' - Maximum number of previously edited files marks
	"   < - Maximum number of lines saved for each register
	"   @ - Maximum number of items in the input-line history to be
	"   s - Maximum size of an item contents in KiB
	"   h - Disable the effect of 'hlsearch' when loading the shada
	set shada='300,<10,@50,s100,h
else
	set viminfo='300,<10,@50,h,n$VARPATH/viminfo
endif

" }}}
" Tabs and Indents {{{
" ----------------
set textwidth=80    " Text width maximum chars before wrapping
set noexpandtab     " Don't expand tabs to spaces.
set tabstop=2       " The number of spaces a tab is
set softtabstop=2   " While performing editing operations
set shiftwidth=2    " Number of spaces to use in auto(indent)
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'

" }}}
" Timing {{{
" ------
set timeout ttimeout
set timeoutlen=750  " Time out on mappings
set updatetime=1000 " Idle time to write swap and trigger CursorHold

" Time out on key codes
if has('nvim')
	" https://github.com/neovim/neovim/issues/2017
	set ttimeoutlen=-1
else
	set ttimeoutlen=250
endif

" }}}
" Searching {{{
" ---------
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed

" }}}
" Behavior {{{
" --------
set nowrap                      " No wrap by default
set linebreak                   " Break long lines at 'breakat'
set breakat=\ \	;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,usetab    " Jump to the first open window in any tab
set switchbuf+=vsplit           " Switch buffer behavior to vsplit
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore white
set showfulltag                 " Show tag and tidy search in completion
set complete=.                  " No wins, buffs, tags, include scanning
set completeopt=menuone         " Show menu even for one item
set completeopt+=noselect       " Do not select a match in the menu
if has('patch-7.4.775')
	set completeopt+=noinsert
endif

if exists('+inccommand')
	set inccommand=nosplit
endif

" }}}
" Editor UI Appearance {{{
" --------------------
set noshowmode          " Don't show mode in cmd window
set shortmess=aoOTI     " Shorten messages and don't show intro
set scrolloff=2         " Keep at least 2 lines above/below
set sidescrolloff=5     " Keep at least 5 lines left/right
set number              " Show line numbers
set noruler             " Disable default status ruler
set list                " Show hidden characters

set showtabline=2       " Always show the tabs line
set winwidth=30         " Minimum width for active window
set winheight=1         " Minimum height for active window
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height

set noshowcmd           " Don't show command in status line
set cmdheight=2         " Height of the command line
set cmdwinheight=5      " Command-line lines
set noequalalways       " Don't resize windows on split or close
set laststatus=2        " Always show a status line
set colorcolumn=80      " Highlight the 80th character limit
set display=lastline

" Do not display completion messages
" Patch: https://groups.google.com/forum/#!topic/vim_dev/WeBBjkXE8H8
if has('patch-7.4.314')
	set shortmess+=c
endif

" Do not display message when editing files
if has('patch-7.4.1570')
	set shortmess+=F
endif

" For snippet_complete marker
if has('conceal') && v:version >= 703
	set conceallevel=2 concealcursor=niv
endif

" }}}
" Folds {{{
" -----

" FastFold
" Credits: https://github.com/Shougo/shougo-s-github
autocmd MyAutoCmd TextChangedI,TextChanged *
	\ if &l:foldenable && &l:foldmethod !=# 'manual' |
	\   let b:foldmethod_save = &l:foldmethod |
	\   let &l:foldmethod = 'manual' |
	\ endif

autocmd MyAutoCmd BufWritePost *
	\ if &l:foldmethod ==# 'manual' && exists('b:foldmethod_save') |
	\   let &l:foldmethod = b:foldmethod_save |
	\   execute 'normal! zx' |
	\ endif

if has('folding')
	set foldenable
	set foldmethod=syntax
	set foldlevelstart=99
	set foldtext=FoldText()
endif

" Improved Vim fold-text
" See: http://www.gregsexton.org/2011/03/improving-the-text-displayed-in-a-fold/
function! FoldText()
	" Get first non-blank line
	let fs = v:foldstart
	while getline(fs) =~? '^\s*$' | let fs = nextnonblank(fs + 1)
	endwhile
	if fs > v:foldend
		let line = getline(v:foldstart)
	else
		let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
	endif

	let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
	let foldSize = 1 + v:foldend - v:foldstart
	let foldSizeStr = ' ' . foldSize . ' lines '
	let foldLevelStr = repeat('+--', v:foldlevel)
	let lineCount = line('$')
	let foldPercentage = printf('[%.1f', (foldSize*1.0)/lineCount*100) . '%] '
	let expansionString = repeat('.', w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
	return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction

" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :










































" System Settings  ----------------------------------------------------------{{{

" Reduce the wait time for vim to switch from insert to normal to visual
  " set timeoutlen=1000 ttimeoutlen=10

" Setting up the directories
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
  let g:is_posix = 1

"}}}"

" System Mappings  ----------------------------------------------------------{{{

" No need for ex mode
  nnoremap Q <nop>
  vnoremap // y/<C-R>"<CR>
" exit insert, dd line, enter insert
  inoremap <c-d> <esc>ddi

" exit insert, dd line, enter insert
  inoremap <c-d> <esc>ddi
  noremap H ^
  noremap L g_

" Quicker window movement
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-h> <C-w>h
  nnoremap <C-l> <C-w>l

" Wrapped lines goes down/up to next row, rather than next line in file.
" provide hjkl movements in Insert mode via the <Alt> modifier key
  inoremap <A-h> <C-o>h
  inoremap <A-j> <C-o>j
  inoremap <A-k> <C-o>k
  inoremap <A-l> <C-o>l

" Visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv

" fast save
  nmap <leader>w :w!<cr>

" search highlighting
  " map <space>
  " map <c-space> /
  nnoremap <silent> <esc> :noh<cr>                " clear search highlighting


" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
  vnoremap . :normal .<CR>

" getting out of insert mode fast!
  imap jk <Esc>l

" These create newlines like o and O but stay in normal mode
  nnoremap zj o<Esc>k
  nnoremap zk O<Esc>j

  set backspace=indent,eol,start            " Allow backspace to delete through multiple lines
  nnoremap <F5> :source ~/.vim/init.vim<CR> " reload vimrc file

" Open new split panes to right and bottom, which feels more natural
  set splitbelow
  set splitright

"}}}"

" Editor Settings  ----------------------------------------------------------{{{


  " Netrw -------------------------------------------------------------------{{{
"
"     " nnoremap <C-n> :e .<CR>
"     let g:netrw_banner = 0
"     let g:netrw_liststyle = 3
"     let g:netrw_browse_split = 4 "open files in the previous window
"     let g:netrw_altv = 1
"     let g:netrw_winsize = 15
"
"     " Netrw settings to looklike nerdtree
"     " Toggle Vexplore with Ctrl-E
"     function! ToggleVExplorer()
"       if exists("t:expl_buf_num")
"           let expl_win_num = bufwinnr(t:expl_buf_num)
"           if expl_win_num != -1
"               let cur_win_nr = winnr()
"               exec expl_win_num . 'wincmd w'
"               close
"               exec cur_win_nr . 'wincmd w'
"               unlet t:expl_buf_num
"           else
"               unlet t:expl_buf_num
"           endif
"       else
"           exec '1wincmd w'
"           Vexplore
"           let t:expl_buf_num = bufnr("%")
"       endif
"     endfunction
"     map <silent> <C-\> :call ToggleVExplorer()<CR>
"     let g:netrw_browse_split = 4
"     let g:netrw_altv = 1
"   "}}}
"

  " Fold, gets it's own section  ----------------------------------------------{{{

    call dein#add('nelstrom/vim-markdown-folding', {'on_ft': 'markdown'})


  " Saving spot for folding
    autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif


  " Working with vim file
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal fdc=1
    autocmd FileType vim setlocal foldlevel=0

  " Setting automatic folder per file type
    autocmd FileType python setlocal foldmethod=syntax
  "}}}

  " SuperTab like snippets behavior --------------------------------------------{{{
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"


    let g:neosnippet#snippets_directory='~/.vim/snippets'
  "}}}


  " Tagbars -----------------------------------------------------------------{{{
  nmap <F8> :TagbarToggle<CR>
  " let g:tagbar_width = 20
  "  }}}
"}}}

" Extra Tools Settings ------------------------------------------------------{{{

  " Vim-test ---------------------------------------------------------____---{{{

    " let test#strategy = "neoterm"

    nmap <silent> <leader>t :TestNearest<CR>
    nmap <silent> <leader>T :TestFile<CR>
    nmap <silent> <leader>a :TestSuite<CR>
    nmap <silent> <leader>l :TestLast<CR>
    nmap <silent> <leader>g :TestVisit<CR>
  " }}}

  " Nvim terminal -------------------------------------------------------------{{{


    " Neovim terminal mapping
    tnoremap <Esc> <C-\><C-n>
    " au BufEnter * if &buftype == 'terminal' | :startinsert | endif
    " autocmd BufEnter term://* startinsert
    " autocmd TermOpen * set bufhidden=hide

    " setting buffer for fzf to use
    au BufEnter * if &buftype == 'terminal' | :startinsert | endif

    " change cursor to bar in insert mode
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

    nnoremap <A-\> :Ttoggle<CR>
    let g:neoterm_autoinsert = 1
    let g:neoterm_size=10


    " useful (re)-maps
    nnoremap <silent> ,th :call neoterm#close()<cr>  "hide/close terminal
    nnoremap <silent> ,tl :call neoterm#clear()<cr>  "clear terminal
    nnoremap <silent> ,tc :call neoterm#kill()<cr>   "kill current job <Ctrl-c>

    " Neoterm
    " nnoremap <silent> <C-c> :T/
    " hide/close terminal
    " nnoremap <silent> <C-l> :call neoterm#clear()<cr>

    " nnoremap <silent> <leader>tc :call neoterm#kill()<cr>


  " }}}
  "
" }}}


" Code formatting -----------------------------------------------------------{{{
  " automatic pairing of bracket, quotes, etc...


" Language Specifics---------------------------------------------------------{{{

  " Markdown ----------------------------------------------------------------{{{
    " Auto command specific to markdown
    au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
    au FileType markdown setlocal textwidth=100

    let g:markdown_fenced_languages = ['javascript', 'ruby', 'sh', 'yaml', 'javascript', 'html', 'vim', 'json', 'diff']
  " }}}

  " GoLang-------------------------------------------------------------------{{{
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_fmt_command = "goimports"

    " autocommand for golang specifics
    au FileType go nmap <Leader>] <Plug>(go-implements)
    au FileType go nmap <Leader>i <Plug>(go-info)
    au FileType go nmap <Leader>h <Plug>(go-rename)
    au FileType go nmap <leader>r <Plug>(go-run)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <Leader>gd <Plug>(go-doc)
    au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
    au FileType go nmap <leader>co <Plug>(go-coverage)

    " deoplete-go
    let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
    let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
    let g:deoplete#sources#go#use_cache = 1
    let g:go_fmt_command = 'goimports'
    let g:deoplete#sources#go = 'vim-go'


  " }}}

  " Python ------------------------------------------------------------------{{{

    let g:pymode_rope_rename_bind = '<C-c>rr'

    " PythonMode {{{ -------------------------------------------------------------
      nmap <silent><Leader>n :PymodeLint<CR>

      let g:pymode_python = 'python3'
      let g:pymode_breakpoint_bind = '<Leader>B'
      let g:pymode_lint = 1
      let g:pymode_lint_on_write = 0
      let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pep257']
      let g:pymode_lint_ignore = ''
      let g:pymode_virtualenv = 0
      " Code assist op, completion, refactoring
      let g:pymode_rope = 1


      let g:pymode_rope_completion = 0
      let g:pymode_rope_complete_on_dot = 1

      " }}}

      " let g:python_host_prog = '/usr/local/bin/python2'
      " let g:python3_host_prog = '/usr/local/bin/python3'
      " let $NVIM_PYTHON_LOG_FILE='nvim-python.log'
      let g:jedi#auto_vim_configuration = 0
      " let g:jedi#documentation_command = "<leader>k"

      " settin the test runner for vim-test
      let test#python#runner = 'pytest'

  " }}}

"  }}}

" Search --------------------------------------------------------------------{{{


  " let g:fzf_tags_command = 'ctags -R'
  " let g:fzf_buffers_jump = 1
  " let g:fzf_nvim_statusline = 0 " disable statusline overwriting
  " let g:fzf_layout = { 'down': '~15%' }

  " Mapping selecting mappings
  " nmap <leader><tab> <plug>(fzf-maps-n)
  " xmap <leader><tab> <plug>(fzf-maps-x)
  " omap <leader><tab> <plug>(fzf-maps-o)

  " Insert mode completion
  " Useful for completing hard to spell words
  " imap <c-x><c-k> <plug>(fzf-complete-word)
  " inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'options': '-q '.shellescape(expand('<cword>')),'left': '13%'})

  " Useful to add folder path
  " imap <c-x><c-f> <plug>(fzf-complete-path)
  " Useful to FILE path
  " imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  " Useful to add line that has been written before
  " imap <c-x><c-l> <plug>(fzf-complete-line)


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
  " command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args)

  " Special mapping for fzf
  " nnoremap <silent> <C-p> :Files<CR>
  " nnoremap <silent> <leader>b :Buffers<CR>
  " nnoremap <silent> <leader>A :Windows<CR>
  " nnoremap <silent> <leader>; :BLines<CR>
  " nnoremap <silent> <leader>o :BTags<CR>
  " nnoremap <silent> <leader>e :Tags<CR>
  " nnoremap <silent> <leader>? :History<CR>
  " nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
  " nnoremap <silent> <leader>. :AgIn

  " nnoremap <silent> <leader>K :call SearchWordWithAg()<CR>
  " vnoremap <silent> <leader>K :call SearchVisualSelectionWithAg()<CR>
  " nnoremap <silent> <leader>gl :Commits<CR>
  " nnoremap <silent> <leader>ga :BCommits<CR>
  " nnoremap <silent> <leader>ft :Filetypes<CR>

  " use to look for the same words under, this should be switched over to fzf
  " nmap <leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

  " }
"}}}

" Extra
  if get(g:, 'elite_mode')
      nnoremap <Up>    :resize -2<CR>
      nnoremap <Down>  :resize +2<CR>
      nnoremap <Left>  :vertical resize -2<CR>
      nnoremap <Right> :vertical resize +2<CR>
  endif



" Need Fixing --------------- ------------------------------------------------{{{
" Workspace Setup
" ----------------
function! DefaultWorkspace()
    " Rough num columns to decide between laptop and big monitor screens
    let numcol = 2
    if winwidth(0) >= 220
        let numcol = 3
    endif

    if numcol == 3
        e term://zsh
        file Shell\ Two
        vnew
    endif

    vsp term://~/Programs/golang/context
    file Context
    sp term://zsh
    file Shell\ One
    wincmd k
    resize 4
    wincmd h
endfunction
command! -register DefaultWorkspace call DefaultWorkspace()

" ######################### Normal mode mapping
