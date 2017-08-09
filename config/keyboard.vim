scriptencoding utf-8

" Remove all extra spaces at the end of all lines
nmap <Leader>$ :call Preserve("%s/\\s\\+$//e")<CR>
vmap <Leader>$ :call Preserve("s/\\s\\+$//e")<CR>

" Reindent file
nmap <Leader>= :call Preserve("normal gg=G")<CR>

" Mimic Emacs line editing
noremap! <C-f> <Right>
noremap! <C-b> <Left>
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <C-d> <Del>
inoremap <C-q> <C-d>
" <A-f> and <A-b> to jump words
noremap! ƒ <C-Right>
noremap! ∫ <C-Left>
" <A-d> to delete a word forward
noremap! ∂ <C-o>dw

" Take what's typed into account when moving through commands history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Create new change to be able to undo <C-u> and <C-w> deletions
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

nnoremap <silent> <C-l> :nohlsearch <Bar> call <SID>Refresh()<CR><C-l>
imap <C-l> <Esc><C-l>

function! s:Refresh()
  if has('diff')
    diffupdate
  endif
  if &filetype ==# 'netrw'
    execute "normal \<Plug>NetrwRefresh"
  endif
endfunction

" Select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" Prevent page scroll on <S-CR>, I mistakenly press <S-CR> somethimes because
" I have <D-S-CR> mapping to insert a new line before current
nnoremap <S-CR> <CR>

" Change word case in INSERT mode
inoremap ç <C-o>guiw
inoremap Ç <C-o>gUiw
inoremap <C-c> <Esc>guiw~bi
