if &compatible
  set nocompatible
end
" #############################

" In your .vimrc.before.local file
" list only the plugin groups you will use
if !exists('g:spf13_bundle_groups')
    let g:spf13_bundle_groups=['general', 'writing', 'neocomplete', 'programming', 'php', 'ruby', 'python', 'javascript', 'html', 'misc',]
endif

if filereadable(expand("~/.vim/plug.vim"))
  source ~/.vim/plug.vim
endif

" #############################
set backup                  " Backups are nice ...
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

let g:python3_host_prog = '/home/hle/.virtualenvs/nvim/bin/python3'

filetype plugin indent on

let mapleader = " "



" ################################# General Settings
" {
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

  " Switch syntax highlighting on, when the terminal has colors
  " Also switch on highlighting the last used search pattern.
  if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
  endif

  " When the type of shell script is /bin/sh, assume a POSIX-compatible
  " shell for syntax highlighting purposes.
  let g:is_posix = 1
" }

" ################################### Vim Behavior on command
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

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

set termguicolors                       " set for truecolors

execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME


" ################################ General Vim Custom Mapping

nnoremap <leader><leader> <c-^>           " Switch between the last two files
imap <C-h> <C-w>                          " Detele an entire word when holding control and backspace
set backspace=indent,eol,start            " Backspace for dummies
nnoremap <F5> :source ~/.vim/init.vim<CR> " reload vimrc file

" Get off my lawn
" {{{
  nnoremap <Left> :echoe "Use h"<CR>
  nnoremap <Right> :echoe "Use l"<CR>
  nnoremap <Up> :echoe "Use k"<CR>
  nnoremap <Down> :echoe "Use j"<CR>
" }}}

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

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


" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>



" ####################################### Navigation

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

" #################################### Plugin settings

" Plugins {

    " GoLang {
      if count(g:spf13_bundle_groups, 'go')
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
        let g:pymode_python = 'python3'
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
        inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    " }

    " Deoplete {
      let g:deoplete#enable_at_startup = 1
      let g:deoplete#disable_auto_complete = 0 " dropdown autocomplete

      inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
      function! s:my_cr_function()
        return pumvisible() ? deoplete#mappings#close_popup() : "\n"
      endfunction

      " Close the documentation window when completion is done
      autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

      " " deoplete-clang
      " let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
      " let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'

      " deoplete-jedi
      let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
      let g:deoplete#sources#jedi#enable_cache = 1
      let g:deoplete#auto_completion_start_length = 1


      " " deoplete-go
      " let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
      " let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
      " let g:deoplete#sources#go#use_cache = 1
      " let g:go_fmt_command = 'goimports'
      " let g:deoplete#sources#go = 'vim-go'

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
      set conceallevel=2
      let g:vim_markdown_folding_disabled = 1
      " let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
      let g:markdown_fenced_languages = ['javascript', 'ruby', 'sh', 'yaml', 'javascript', 'html', 'vim', 'coffee', 'json', 'diff']
      let g:vim_markdown_frontmatter = 1
      let g:vim_markdown_toml_frontmatter = 1
      " let g:vim_markdown_new_list_item_indent = 2
    " }

    " vim-pencil {
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
