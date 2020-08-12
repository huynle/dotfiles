" General {{{
set mouse=nv                 " Disable mouse in command-line mode
set modeline                 " automatically setting options from modelines
set lazyredraw
set report=0                 " Don't report on line changes
set errorbells               " Trigger bell on error
set visualbell               " Use visual bell instead of beeping
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path=.,**                " Directories to search when using gf
set virtualedit=block        " Position cursor anywhere in visual block
set synmaxcol=1000           " Don't syntax highlight long lines
set formatoptions-=t         " Don't auto-wrap text
set tags=./tags;

" Tabs and Indents {{{
" ----------------
" set textwidth=120    " Text width maximum chars before wrapping
set noexpandtab     " Don't expand tabs to spaces.
set tabstop=2       " The number of spaces a tab is
set softtabstop=2   " While performing editing operations
set shiftwidth=2    " Number of spaces to use in auto(indent)
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set smartindent				" configure tabwidth and insert spaces instead of tabs
set expandtab        	" expand tabs to spaces
set t_Co=256
" set number 		" highlight matching braces
set relativenumber
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */ " intelligent comments

" }}}
" Timing {{{
" ------
set timeout ttimeout
set timeoutlen=750  " Time out on mappings
set updatetime=1000 " Idle time to write swap and trigger CursorHold

" Time out on key codes
set ttimeoutlen=10

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
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore white
set showfulltag                 " Show tag and tidy search in completion

if has('patch-7.4.775')
	set completeopt+=noinsert
endif

if exists('+inccommand')
	set inccommand=nosplit
endif

" }}}

" Editor UI Appearance {{{
" --------------------
set showmode          " Don't show mode in cmd window
set shortmess=aoOTI     " Shorten messages and don't show intro
set scrolloff=2         " Keep at least 2 lines above/below
set sidescrolloff=5     " Keep at least 5 lines left/right
set number							" Show line numbers
set noruler             " Disable default status ruler
set nolist                " Show hidden characters

set showtabline=2       " Always show the tabs line
set winwidth=30         " Minimum width for active window
set winheight=1         " Minimum height for active window
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height

set noshowcmd           " Don't show command in status line
set cmdheight=1         " Height of the command line
set cmdwinheight=5      " Command-line lines
set noequalalways       " Don't resize windows on split or close
set laststatus=2        " Always show a status line
set display=lastline
set nofoldenable

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
  set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
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
  set wildignore+=.idea
endif

" Key-mappings
"---------------------------------------------------------

" Non-standard {{{
" ------------

" Window-control prefix
nnoremap  [Window]   <Nop>
nmap      s [Window]

" Fix keybind name for Ctrl+Spacebar
map <Nul> <C-Space>
map! <Nul> <C-Space>

" refresh vimrc
nnoremap <F2> :source $VIMRC <CR>:echomsg "Reloaded vimrc"<CR>
" Disable arrow movement, resize splits instead.
nnoremap <Down>    :resize +5<CR>
nnoremap <Up>  :resize -5<CR>
nnoremap <Right>  :vertical resize +5<CR>
nnoremap <Left> :vertical resize -5<CR>

" Double leader key for toggling visual-line mode
" nmap <silent> <Leader><Leader> V
" vmap <Leader><Leader> <Esc>
nmap <Leader><Leader> :sb<SPACE>

" Change current word in a repeatable manner
nnoremap cn *``cgn
nnoremap cN *``cgN

" Change selected word in a repeatable manner
vnoremap <expr> cn "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgn"
vnoremap <expr> cN "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgN"

" do a copy of the paragraph
nnoremap cp yap<S-}>p

" fix indents
nnoremap <leader>a =ip

" Toggle fold
nnoremap <CR> za

" Focus the current fold by closing all others
nnoremap <S-z> zMzvzz
" Go to line and fold everything else, nice for debugging
" nnoremap gg GzMzvzz

" Use backspace key for matchit.vim
nmap <BS> %
xmap <BS> %

"}}}
" Global niceties {{{
" ---------------

" Start an external command with a single bang
nnoremap ! :!

" Allow misspellings
cnoreabbrev qw wq
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd

" Start new line from any cursor position
inoremap <S-Return> <C-o>o

" Quick substitute within selected area
xnoremap s :s//g<Left><Left>

" Improve scroll, credits: https://gijhub.com/Shougo
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
  \ 'zt' : (winline() == 1) ? 'zb' : 'zz'
noremap <expr> <C-f> max([winheight(0) - 2, 1])
  \ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
  \ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")

" Window control
nnoremap <C-x> <C-w>x
nnoremap <silent><C-w>z :vert resize<CR>:resize<CR>:normal! ze<CR>

" Select blocks after indenting
xnoremap < <gv
xnoremap > >gv|

" Use tab for indenting in visual mode
vnoremap <Tab> >gv|
vnoremap <S-Tab> <gv
nnoremap > >>_
nnoremap < <<_

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Select last paste
nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

" Navigation in command line
cnoremap <C-h> <Home>
cnoremap <C-l> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <C-w>

" Switch history search pairs, matching my bash shell
cnoremap <C-p>  <Up>
cnoremap <C-n>  <Down>
cnoremap <Up>   <C-p>
cnoremap <Down> <C-n>

" }}}
" File operations {{{
" ---------------
" When pressing <leader>cd switch to the directory of the open buffer
map <Leader>cd :lcd %:p:h<CR>:pwd<CR>

" Save a file with sudo
" http://forrst.com/posts/Use_w_to_sudo_write_a_file_with_Vim-uAN
cmap W!! w !sudo tee % >/dev/null

" }}}
" Editor UI {{{
" ---------
nnoremap <silent> q :<C-u>:quit<CR>

" Macros
nnoremap Q q
nnoremap gQ @q

" getting out of insert mode fast!
imap jk <Esc>

" Binding to record j/k to the jumplist
nnoremap <expr> k (v:count >1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count >1 ? "m'" . v:count : '') . 'gj'

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" Visual shifting (does not exit Visual mode)
vnoremap <C-d> <gv
vnoremap <C-t> >gv

" Toggle editor visuals
nmap <silent> <Leader>ts :setlocal spell!<cr>
nmap <silent> <Leader>tn :setlocal nonumber!<CR>
nmap <silent> <Leader>tl :setlocal nolist!<CR>
nmap <silent> <Leader>th :nohlsearch<CR>
nmap <silent> <Leader>tw :setlocal wrap! breakindent!<CR>

" Tabs
nnoremap <silent> <S-l> :<C-U>tabnext<CR>
nnoremap <silent> <S-h> :<C-U>tabprevious<CR>


" }}}
" Totally Custom {{{
" --------------

" " Moving back and forth beween searches with n and N
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

" Remove spaces at the end of lines
nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" C-r: Easier search and replace, replace with confirmation
xnoremap <C-r> :<C-u>call <SID>get_selection('/')<CR>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>

"}}}

" Drag current line/s vertically and auto-indent
vnoremap mk :m-2<CR>gv=gv
vnoremap mj :m'>+<CR>gv=gv
noremap  mk :m-2<CR>
noremap  mj :m+<CR>

" Adding empty lines above and below current line, can also use `5[<space>` to
" get 5 lines added. for normal mode this is taken care by unimpaired vim
vnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
vnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" duplicate line
nnoremap <Leader>d mzYP`z
vnoremap <Leader>d YPgv

" Session management shortcuts
nmap <silent> <Leader>se :<C-u>execute 'SessionSave '.fnamemodify(resolve(getcwd()), ':p:gs?[\\/:-]?_?')<CR>
nmap <silent> <Leader>os :<C-u>execute 'source '.g:session_directory.'/'.fnamemodify(resolve(getcwd()), ':p:gs?[\\/:-]?_?').'.vim'<CR>

" adding saving session by using current working directory of the project
nnoremap <silent> <C-q> :execute 'SessionSave '.fnamemodify(resolve(getcwd()), ':p:gs?[\\/:-]?_?')<CR>:wqa!<CR>

" Toggle Verbose for vim debugging
nnoremap <silent><Leader>db :<C-u>call <SID>toggle_verbose()<CR>

let g:verbose_level = 9
function! s:toggle_verbose()
  if !&verbose
    execute "set verbosefile=".$VARPATH.'/vim.log'
    execute "set verbose=".g:verbose_level
    echomsg "======== DEBUGGING STARTED ============"
    echomsg "Verbose set to ".g:verbose_level
  else
    echomsg "======== DEBUGGING STOPPED ============"
    set verbose=0
    set verbosefile=
  endif

endfunction

" }}}
" Display diff from last save {{{
command! DiffOrig vert new | setlocal bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
" }}}
" Append modeline to EOF {{{
nnoremap <silent> <Leader>ml :call <SID>append_modeline()<CR>

" Append modeline after last line in buffer
" See: http://vim.wikia.com/wiki/Modeline_magic
function! s:append_modeline() "{{{
  let l:modeline = printf(' vim: set ts=%d sw=%d tw=%d %set :',
    \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, '%s', l:modeline, '')
  call append(line('$'), l:modeline)
endfunction

" }}}

" s: Windows and buffers {{{

" Uses g:lasttab set on TabLeave in MyAutoCmd
let g:lasttab = 1
nmap <silent> \\ :execute 'tabn '.g:lasttab<CR>

" Custom window movement
nnoremap <silent> [Window]g  :<C-u>split<CR>:wincmd p<CR>:e#<CR>
nnoremap <silent> [Window]v  :<C-u>vsplit<CR>:wincmd p<CR>:e#<CR>
nnoremap <silent> [Window]t  :<C-u>tab split<CR>:execute 'tabn '.g:lasttab<CR>
nnoremap <silent> [Window]T  :tabnew<CR>
nnoremap <silent> [Window]o  :<C-u>only<CR>
nnoremap <silent> [Window]b  :b#<CR>
nnoremap <silent> [Window]c  :close<CR>
nnoremap <silent> [Window]x  :<C-u>call <SID>BufferEmpty()<CR>
" View tag in vim preview window. This is short for <c-w>}
" nnoremap <silent> [Window]}  :execute "ptjump " . expand("<cword>")<CR>
nnoremap <silent> [Window]]  <C-w>]
nnoremap <silent> [Window]=  <C-w>=
nnoremap <silent> [Window]H  <C-w>H
nnoremap <silent> [Window]J  <C-w>J
nnoremap <silent> [Window]K  <C-w>K
nnoremap <silent> [Window]L  <C-w>L
nnoremap <silent> [Window]z  <C-w>z


function! WipeHiddenBuffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction

function! s:BufferEmpty()
  let l:current = bufnr('%')
  if ! getbufvar(l:current, '&modified')
    enew
    silent! execute 'bdelete '.l:current
  endif
endfunction

function! s:SweepBuffers()
  let bufs = range(1, bufnr('$'))
  let hidden = filter(bufs, 'buflisted(v:val) && !bufloaded(v:val)')
  if ! empty(hidden)
    execute 'silent bdelete' join(hidden)
  endif
endfunction

" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status =
    \ system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec 'edit ' . filenames[0]
  for filename in filenames[1:]
    exec 'sp ' . filename
  endfor
endfunction





