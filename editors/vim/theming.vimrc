" Overall colorscheme and settings
colorscheme one

if $BACKGROUND == 'dark'
  set background=dark
elseif $BACKGROUND == 'light'
  set background=light
endif


" For Vim inside tmux, you can add the following snippet in your ~/.vimrc
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

" airline options
set laststatus=2  " fix airline not starting until split
let g:airline_theme='one'
let g:one_allow_italics = 1 " I love italic for comments

if !has('gui_running') && !has('win32')
  " patch the font, note the 'powerline', this font is not installed because powerline is not installed.
	let g:airline_powerline_fonts=1
endif


let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#empty_message='no repo'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#whitespace#mixed_indent_algo=1 "Tabs before spaces

let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

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

" Turn off tmuxline extension for vim
" let g:airline#extensions#tmuxline#enabled = 0
" let g:tmuxline_theme = 'icebert'
" let g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
"       \'win'  : ['#I', '#W'],
"       \'cwin' : ['#I', '#W', '#F'],
"       \'x'    : '#(date)',
"       \'y'    : ['%R', '%a', '%Y'],
"       \'z'    : '#H'}
"


"Tmuxline - :TmuxlineSnapshot! ~/.dotfiles/.tmuxline.tmux.conf
"Far bottom right shows DHCP WiFi IP, with an H appended at home
let g:tmuxline_preset = {
	\'a'       : '#S:#I',
	\'b disabled'       : '',
	\'c disabled'       : '',
	\'win'     : ['#I', '#W'],
	\'cwin'    : ['#I', '#W'],
	\'x'       : '#(~/.dotfiles/bin/tmux-battery)',
	\'y'       : ['%a', '%Y-%m-%d', '%l:%M%p'],
	\'z'       : ['#(whoami)', '#(~/.dotfiles/bin/getipfortmux || echo GOTMILK)'],
	\'options' : {'status-justify': 'left'}}



function! UpdateTmuxlineConf()
  " Saves the config to a file so when tmux opens, it sources this file to get the status line config
  :TmuxlineSnapshot! ~/.dotfiles/terminals/tmux/tmuxline.conf
endfunction

" create status bar color config file for tmux from airline settings
map <Leader>al :call UpdateTmuxlineConf()<CR>

" TODO: need to be able to toggle back to light!!!
" map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" ) <bar> :call UpdateTmuxlineConf()<CR>
map <Leader>bg :call BGToggle()<CR>



function! BGToggle()
  if (&background == "light")
    let &background="dark"
    let $BACKGROUND = 'dark'
  else
     let &background="light"
     colorscheme one
     let $BACKGROUND = 'light'
  endif
  call UpdateTmuxlineConf()
endfunction


function! BgChange(color)
  if (a:color == "light")
    let &background=a:color
  elseif(a:color == "dark")
    let &background=b:color
  endif

  call UpdateTmuxlineConf()
endfunction


function! UpdateTmuxLine(color)
  call UpdateTmuxlineConf()
endfunction
