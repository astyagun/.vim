" Remove all extra spaces at the end of all lines
nmap <Leader>$ :call Preserve("%s/\\s\\+$//e")<CR>
vmap <Leader>$ :call Preserve("s/\\s\\+$//e")<CR>

" Reindent file
nmap <Leader>= :call Preserve("normal gg=G")<CR>

" Mimic Emacs line editing
inoremap <C-f> <Right>
inoremap <C-b> <Left>
noremap! <C-a> <Home>
inoremap <C-e> <End>
noremap! <C-l> <Del>
" <A-f> and <A-b> to jump words
noremap! ƒ <C-Right>
noremap! ∫ <C-Left>
" <A-d> to delete a word forward
inoremap ∂ <C-o>dw

" Take what's typed into account when moving through commands history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Create new change to be able to undo <C-u> and <C-w> deletions
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

nnoremap <silent> <C-l> :call <SID>Refresh()<CR><C-l>

function! s:Refresh()
  nohlsearch
  if has('diff')
    diffupdate
  endif
endfunction

" Select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
