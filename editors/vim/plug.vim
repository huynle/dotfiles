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
" ##################

" Deps {
    Plug 'tomtom/tlib_vim'
    " Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

    if executable('ag')
        Plug 'mileszs/ack.vim'
        let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
    endif
" }


" ############## General Plugins

if count(g:plug_groups, 'general')

  " EasyMotion - Allows <leader><leader>(b|e) to jump to (b)eginning or (end)
  " of words.
  Plug 'easymotion/vim-easymotion'  " use <leader><leader>e or b to invoke
  Plug 'justinmk/vim-sneak'  " use s{char}{char} to invoke, remapped to f
  Plug 'jiangmiao/auto-pairs'
	" Plug 'tpope/vim-vinegar'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
	Plug 'sickill/vim-pasta' " context-aware pasting
  " Plug 'powerline/fonts'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
endif

" ######################## Formatting
if count(g:plug_groups, 'formatting')
	" Plug 'sbdchd/neoformat'
	Plug 'neomake/neomake' " neovim replacement for syntastic using neovim's job control functonality
	" Plug 'tomtom/tlib_vim' " utility functions for vim
endif

" #################### General Programming
if count(g:plug_groups, 'programming')
  " Pick one of the checksyntax, jslint, or syntastic
  " Plug 'tpope/vim-fugitive'
  " Plug 'mattn/gist-vim'
  " Plug 'mattn/webapi-vim'
  " Plug 'tomtom/tcomment_vim'
  Plug 'ervandew/supertab' " Perform all your vim insert mode completions with
  Plug 'luochen1990/rainbow'
  if executable('ctags')
    Plug 'majutsushi/tagbar'
  endif
endif

if count(g:plug_groups, 'snippets')
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'garbas/vim-snipmate'

  " Optional:
  Plug 'honza/vim-snippets'
endif

" ################## Language Plugins

if count(g:plug_groups, 'go')
	" Plug 'fatih/vim-go'
  " Plug 'zchee/deoplete-go', { 'do': 'make'}
endif

if count(g:plug_groups, 'python')
	Plug 'yssource/python.vim'
	" Plug 'klen/python-mode' " comprehensive python plugin
endif

"
" ############## General Programming

if count(g:plug_groups, 'autocomplete')
    Plug 'SirVer/ultisnips' " allow to include snippets
    " Plug 'honza/vim-snippets'

    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'ervandew/supertab' " Perform all your vim insert mode completions with
    " Plug 'zchee/deoplete-jedi'      " python specific deoplete

    " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    " Plug 'junegunn/fzf.vim'
endif

if count(g:plug_groups, 'programming')
  " Plug 'janko-m/vim-test'
endif

" #################### Unit testings


" ######### Vim as a text writer
if count(g:plug_groups, 'writing')
  " Plug 'mattly/iterm-colors-pencil'
  Plug 'reedes/vim-wordy'
  Plug 'reedes/vim-litecorrect'
  Plug 'reedes/vim-textobj-sentence'
  Plug 'reedes/vim-textobj-quote'
  Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown
  Plug 'nelstrom/vim-markdown-folding', {'for': 'markdown'}

  Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
endif

" ################################

if count(g:plug_groups, 'visual')
  " colorschemes
  " Plug 'joshdick/onedark.vim'
  " Plug 'chriskempson/base16-vim'
  " Plug 'rakr/vim-one'
endif

if filereadable(expand("~/.plug.vim.local"))
  source ~/.plug.vim.local
endif

call plug#end()
