if &compatible
  set nocompatible
end

set autoread                " detect when a file is changed

set backup                  " Backups are nice ...
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" let g:python_host_prog = '/home/hle/.virtualenvs/nvim/bin/python'
let g:python3_host_prog = '/home/hle/.virtualenvs/nvim/bin/python3'


if filereadable(expand("~/.vim/plug.vim"))
  source ~/.vim/plug.vim
endif

filetype plugin indent on

" switch cursor to line when in insert mode, and block when not
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175


let mapleader = " "

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
set autowrite                       " Automatically write a file when leaving a modified buffer
set ignorecase                      " Ignorecase searches
set swapfile
" set autoindent
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
" set spell                           " Spell checking on
" set hidden                          " Allow buffer switching without saving
" set iskeyword-=.                    " '.' is an end of word designator
" set iskeyword-=#                    " '#' is an end of word designator
" set iskeyword-=-                    " '-' is an end of word designator
"
" " Softtabs, 2 spaces
" set tabstop=2
" set shiftwidth=2
" set shiftround
" set expandtab
" set wrap
" set linebreak
" set nolist
"
" Reduce the wait time for vim to switch from insert to normal to visual
set timeoutlen=1000 ttimeoutlen=10

" Make it obvious where 80 characters is
" set textwidth=80

" Numbers
set number
set numberwidth=2


" Setting up the directories {
if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

" Use one space, not two, after punctuation.
set nojoinspaces


" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Restore cursor to file position in previous editing session
function! ResCur()
    if line("'\"") <= line("$")
        silent! normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1


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

" " Tab completion
" " will insert tab at beginning of line,
" " will use completion if not at beginning
" set wildmode=list:longest,list:full
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-p>"
"     endif
" endfunction
" inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <S-Tab> <c-n>
"
" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Detele an entire word when holding control and backspace
imap <C-h> <C-w>
set backspace=indent,eol,start


" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'


" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
" let g:syntastic_check_on_open=1
" let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
" let g:syntastic_eruby_ruby_quiet_messages =
"     \ {"regex": "possibly useless use of a variable in void context"}
"
" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
" set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical


" " Misc {
" if isdirectory(expand("~/.vim/plugged/matchit.zip"))
"     let b:match_ignorecase = 1
" endif
" " }

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" source all .vimrc files inside of the zsh/ directory
for f in split(glob('~/.dotfiles/editors/vim/**/*.vimrc'), '\n')
    exe 'source' f
endfor


" Local config
if filereadable($HOME . "~/.vimrc.local")
  source ~/.vimrc.local
endif

nnoremap <Leader>r :source ~/.vim/init.vim<CR>

" set for truecolors
set termguicolors

" nnoremap <silent> <Leader>C :call fzf#run({
" \   'source':
" \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
" \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
" \   'sink':    'colo',
" \   'options': '+m',
" \   'left':    30
" \ })<CR>
"
" command! FZFMru call fzf#run({
" \  'source':  v:oldfiles,
" \  'sink':    'e',
" \  'options': '-m -x +s',
" \  'down':    '40%'})
"
" command! -bang -nargs=* Find call fzf#vim#grep(
" 	\ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
" 	\ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)




" FZF
"""""""""""""""""""""""""""""""""""""

" Toggle NERDTree
" nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
" nmap <silent> <leader>y :NERDTreeFind<cr>

"
" if $BACKGROUND == 'dark'
"   set background=dark
"   " General settings
"   " colorscheme base16-default-dark
"   " Overall colorscheme and settings
"   " airline options
"   " let g:airline_theme='base16_default'
"
" elseif $BACKGROUND == 'light'
"   set background=light
"   " colorscheme base16-default-light
"   " let g:airline_theme='base15_default'
" endif
" set guifont=~/fonts/"make sure to escape the spaces in the name properly
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif

" let g:airline_symbols.space = "\ua0"
" Leave this to show tab at the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0



execute "let g:airline_theme=""'".$THEME."'"
execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME
"
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256  " this line is needed for the airline colors to
"   syn
"   source ~/.vimrc_background
"   " execute "let g:airline_theme='"colors_name"'"
" endif
"
nnoremap <C-n> :e .<CR>
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

" let g:NERDTreeShowIgnoredStatus = 1
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" " airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
"
"

" let g:one_allow_italics = 1 " I love italic for comments
" let g:airline_powerline_fonts=1
" let g:airline_left_sep='>'
" let g:airline_left_alt_sep='>>'
" let g:airline_right_sep='<'
" let g:airline_right_alt_sep='<<'
" let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
" let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
" let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
" let g:airline#extensions#tabline#show_splits = 0
