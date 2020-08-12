" Commands
"---------------------------------------------------------

augroup MyAutoCmd
  " clear group first, then everything else can be loaded
  autocmd!
  
  " you can also write it like the other autocmd below
  autocmd BufRead,BufNewFile *.dr set filetype=python
  autocmd BufWritePost *.cpp,*.h,*.c,*.py,*.vim call UpdateTags()
  autocmd BufWritePost *.cpp,*.h,*.c,*.py call UpdateCscope()
augroup END


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
autocmd MyAutoCmd BufReadPost *
  \ if &ft !~ '^git\c' && ! &diff && line("'\"") > 0 && line("'\"") <= line("$")
  \|   exe 'normal! g`"zvzz'
  \| endif

" Disable paste after leaving insert mode
autocmd MyAutoCmd InsertLeave *
    \ if &paste | set nopaste mouse=a | echo 'nopaste' | endif |
    \ if &l:diff | diffupdate | endif

" Open Quickfix window automatically
autocmd MyAutoCmd QuickFixCmdPost [^l]* leftabove copen
  \ | wincmd p | redraw!
autocmd MyAutoCmd QuickFixCmdPost l* leftabove lopen
  \ | wincmd p | redraw!

" Fix window position of help/quickfix
autocmd MyAutoCmd FileType help if &l:buftype ==# 'help'
  \ | wincmd K | endif
autocmd MyAutoCmd FileType qf   if &l:buftype ==# 'quickfix'
  \ | wincmd J | endif

" Update diff
autocmd MyAutoCmd InsertLeave * if &l:diff | diffupdate | endif

" Open quickfix in split
autocmd MyAutoCmd FileType qf nnoremap <buffer> sv :call <SID>OpenQuickfix("vsplit")<CR>
autocmd MyAutoCmd FileType qf nnoremap <buffer> sg :call <SID>OpenQuickfix("split")<CR>

command! ZoomToggle call s:ZoomToggle()

" Diff command credits: https://github.com/Shougo/shougo-s-github
" Display diff with the file.
command! -nargs=1 -complete=file Diff vertical diffsplit <args>
" Display diff from last save.
command! DiffOrig vert new | setlocal bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
" Disable diff mode.
command! -nargs=0 Undiff setlocal nodiff noscrollbind wrap

" Functions
"---------------------------------------------------------

" Makes * and # work on visual mode too.
" See: http://github.com/nelstrom/vim-visual-star-search
function! VSetSearch(cmdtype) "{{{
  let temp = @s
  normal! gv"sy
  let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
  let @s = temp
endfunction "}}}

function! GetVisualSelection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

" aPPEND MODELINE AFTER LAST LINE IN BUFFer
" See: http://vim.wikia.com/wiki/Modeline_magic
function! AppendModeline() "{{{
  let l:modeline = printf(' vim: set ts=%d sw=%d tw=%d %set :',
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, '%s', l:modeline, '')
  call append(line('$'), l:modeline)
endfunction "}}}

" Zoom / Restore window
function! s:ZoomToggle() "{{{
  if exists('t:zoomed') && t:zoomed > -1
    execute t:zoom_winrestcmd
    let t:zoomed = -1
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = bufnr('%')
  endif
endfunction "}}}

"}}}
