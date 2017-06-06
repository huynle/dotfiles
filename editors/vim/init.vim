if &compatible
  set nocompatible
end

set backup                  " Backups are nice ...
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

let g:python3_host_prog = '/home/hle/.virtualenvs/nvim/bin/python3'

if filereadable(expand("~/.vim/plug.vim"))
  source ~/.vim/plug.vim
endif

filetype plugin indent on

let mapleader = " "


" Allow to trigger background
function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction
noremap <leader>bg :call ToggleBG()<CR>

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
set ignorecase                      " Ignorecase searches
set swapfile
set autoread                " detect when a file is changed
" set autoindent
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too set spell                           " Spell checking on
set number                      " setting line numbers
set numberwidth=2               " setting width of line

" Reduce the wait time for vim to switch from insert to normal to visual
set timeoutlen=1000 ttimeoutlen=10


" Setting up the directories
set backup                      " Backups are nice ...
if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Restore cursor to file position in previous editing session
" To disable this, add the following to your .vimrc.before.local file:
let g:spf13_no_restore_cursor = 1
if !exists('g:spf13_no_restore_cursor')
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
endif


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

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


" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Detele an entire word when holding control and backspace
imap <C-h> <C-w>
set backspace=indent,eol,start

" reload vimrc file
nnoremap <F5> :source ~/.vim/init.vim<CR>

" set for truecolors
set termguicolors

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
