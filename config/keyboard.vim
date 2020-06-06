scriptencoding utf-8

" Formatting {{{

" Remove all extra spaces at the end of all lines
nmap <Leader>$ :call Preserve("%s/\\s\\+$//e")<CR>
vmap <Leader>$ :call Preserve("s/\\s\\+$//e")<CR>

" Reindent file
nmap <Leader>= :call Preserve("normal gg=G")<CR>

" }}} Formatting

"  Clever <C-l> {{{

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

" Add lines before and after current without leaving NORMAL mode
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

" Other {{{

" Select last edited or pasted text
nnoremap gV `[v`]

" Handle accidental <D-[> presses in INSERT mode
imap <D-[> <C-[>

" }}} Other
