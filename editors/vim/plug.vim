
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

" Shim command and function to allow migration from Vundle to vim-plug.
function! VundleToPlug(vundle_command, arg, ...)
  echom "You are using Vundle's `".a:vundle_command."` command to declare plugins. Dotfiles now uses vim-plug for plugin management. Please rename uses of `".a:vundle_command."` to `Plug`. Plugin was '".a:arg."'."
  let vim_plug_options = {}

  if a:0 > 0
    if has_key(a:1, 'name')
      let name = a:1.name
      let vim_plug_options.dir = "$HOME/.vim/bundle/".a:1.name
    endif

    if has_key(a:1, 'rtp')
      let vim_plug_options.rtp = a:1.rtp
    endif
  endif

  Plug a:arg, vim_plug_options
endfunction

com! -nargs=+  -bar Plugin call VundleToPlug("Plugin", <args>)
com! -nargs=+  -bar Bundle call VundleToPlug("Bundle", <args>)

call plug#begin('~/.vim/plugged')

" Define bundles via Github repos
Plug 'christoomey/vim-run-interactive'
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
Plug 'janko-m/vim-test'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/vim-mkdir'
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'kien/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plug 'benmills/vimux'
Plug 'tpope/vim-fugitive' " the ultimate git helper
Plug 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'benmills/vimux' " tmux integration for vim

" Utilities
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer

" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'


if filereadable(expand("~/.plug.vim.local"))
  source ~/.plug.vim.local
endif

call plug#end()
