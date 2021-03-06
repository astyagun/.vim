scriptencoding utf-8

" Formatting {{{

" Remove all extra spaces at the end of all lines
nmap <Leader>$ :call Preserve("%s/\\s\\+$//e")<CR>
vmap <Leader>$ :call Preserve("s/\\s\\+$//e")<CR>

" Reindent file
nmap <Leader>= :call Preserve("normal gg=G")<CR>

" }}} Formatting

" Clever <C-l> {{{

nnoremap <silent> <C-l> :nohlsearch <Bar> call <SID>Refresh()<CR><C-l>

function! s:Refresh() abort
  if has('diff')
    diffupdate
  endif
  if &filetype ==# 'netrw'
    execute "normal \<Plug>NetrwRefresh"
  endif
  SignifyRefresh
endfunction

" }}}

" Add new lines from NORMAL mode {{{

" Add lines before and after current one
nnoremap <D-S-CR> O<Esc>
inoremap <D-S-CR> <Esc>O
nnoremap <S-CR> O<Esc>
inoremap <S-CR> <Esc>O
nnoremap <D-CR> o<Esc>
inoremap <D-CR> <Esc>o

" }}} Add new lines from NORMAL mode

" Window management {{{

" Useful for netrw and quickfix windows
nnoremap <Leader><C-w><Bar> :execute <C-r>=g:sidebar_width<CR> . 'wincmd <Bar>'<CR>
nnoremap <Leader><C-w>_ 10<C-w>_
" Mazimize window
nnoremap <C-w>/ <C-w>_<C-w><Bar>

" Close all buffers
nnoremap <Leader><C-w>c :%bw<CR>

" }}} Window management

" Yanking file path into global pasteboard {{{

" Relative path (src/foo.txt)
nnoremap <Leader>yf :let @+=expand("%")<CR>
" Relative path with line number (src/foo.txt:25)
nnoremap <Leader>yl :let @+=expand("%").":".line(".")<CR>
" Absolute path (/something/src/foo.txt)
nnoremap <Leader>yp :let @+=expand("%:p")<CR>
" Filename (foo.txt)
nnoremap <Leader>yn :let @+=expand("%:t")<CR>
" Directory name (/something/src)
nnoremap <Leader>yd :let @+=expand("%:p:h")<CR>

" }}} Yanking file path into global pasteboard

" Switch to a tab by number {{{

nnoremap <D-1> 1gt
nnoremap <D-2> 2gt
nnoremap <D-3> 3gt
nnoremap <D-4> 4gt
nnoremap <D-5> 5gt
nnoremap <D-6> 6gt
nnoremap <D-7> 7gt
nnoremap <D-8> 8gt
nnoremap <D-9> 9gt

" }}} Switch to a tab by number

" Other {{{

" Select last edited or pasted text
nnoremap gV `[v`]

" Handle accidental <D-[> presses in INSERT mode
noremap! <D-[> <C-[>

" }}} Other
