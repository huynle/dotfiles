
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

" ############## General
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
" Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
" Plug 'vim-scripts/tComment'
Plug 'tpope/vim-fugitive' " the ultimate git helper
Plug 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc sin visual mode

Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
"{{{
" Needed for deoplete completions
"}}}
"
Plug 'godlygeek/tabular'

Plug 'sickill/vim-pasta' " context-aware pasting

" ######################## Formatting

Plug 'sbdchd/neoformat'

Plug 'neomake/neomake' " neovim replacement for syntastic using neovim's job control functonality
"{{{
  autocmd! BufWritePost * Neomake
  let g:neomake_open_list = 2
"}}}



" Plug 'tomtom/tlib_vim' " utility functions for vim

" ################## Language Plugins

Plug 'fatih/vim-go'


Plug 'yssource/python.vim'
Plug 'klen/python-mode' " comprehensive python plugin


"
" ############## Code completions
Plug 'SirVer/ultisnips' " allow to include snippets


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'      " python specific deoplete


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more


Plug 'janko-m/vim-test'



" markdown
" Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
" Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support

" ######### Vim as a text writer
Plug 'mattly/iterm-colors-pencil'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-textobj-quote'
Plug 'plasticboy/vim-markdown'
Plug 'reedes/vim-pencil'              " settings to allow vim to be used as a writer

" ################################

" Utilities
" Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons' " file drawer

" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'rakr/vim-one'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'



if filereadable(expand("~/.plug.vim.local"))
  source ~/.plug.vim.local
endif

call plug#end()
