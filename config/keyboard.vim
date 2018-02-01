scriptencoding utf-8

" Remove all extra spaces at the end of all lines
omap <Leader>$ :call Preserve("%s/\\s\\+$//e")<CR>
vmap <Leader>$ :call Preserve("s/\\s\\+$//e")<CR>

" Reindent file
nmap <Leader>= :call Preserve("normal gg=G")<CR>

" Sort near lines with current indentation level
nmap <Leader>si vii:sort<CR>

" Mimic Emacs line editing (as I see it)
noremap! <C-f> <Right>
noremap! <C-b> <Left>
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <C-d> <Del>
inoremap <C-q> <C-d>
cnoremap <C-k> <C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>
" <A-f> and <A-b> to jump words
noremap! ƒ <C-Right>
noremap! ∫ <C-Left>
map! ÷ ƒ
" <A-b> mapped to this character using Ukelele
map! ← ∫
" <A-d> to delete a word forward
inoremap ∂ <C-o>dw
cnoremap ∂ <C-Right><C-w>
imap ћ ∂
cmap ћ ∂

" Take what's typed into account when moving through commands history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Create new change to be able to undo <C-u> and <C-w> deletions
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-k> <C-g>u<C-o>D

nnoremap <silent> <C-l> :nohlsearch <Bar> call <SID>Refresh()<CR><C-l>
imap <C-l> <Esc><C-l>

function! s:Refresh()
  if has('diff')
    diffupdate
  endif
  if &filetype ==# 'netrw'
    execute "normal \<Plug>NetrwRefresh"
  endif
  SignifyRefresh
endfunction

" Add lines before and after current
nnoremap <D-S-CR> O<Esc>
inoremap <D-S-CR> <Esc>O
nnoremap <S-CR> O<Esc>
inoremap <S-CR> <Esc>O
nnoremap <D-CR> o<Esc>
inoremap <D-CR> <Esc>o

" Change word case in INSERT mode
" <A-c> - capitalize
inoremap ç <Esc>lguiw~wi
imap ≠ ç
" <A-l> - lowercase
inoremap ¬ <Esc>lguiwwi
imap ∆ ¬
" <A-u> - uppercase
inoremap Ò <Esc>lgUiwwi
" Depends on Russian layout modified by Ukelele
imap ∇ Ò

" Change word case in NORMAL mode
" <A-c> - capitalize
nnoremap ç guiw~w
" <A-l> - lowercase
nnoremap ¬ guiww
" <A-S-l> - uppercase
nnoremap Ò gUiww

" Set window size, useful for netrw and quickfix windows
nnoremap <Leader><C-w><Bar> 40<C-w><Bar>
nnoremap <Leader><C-w>_ 10<C-w>_
" Mazimize window
nnoremap <C-w>/ <C-w>_<C-w><Bar>

" Close all buffers
nnoremap <Leader><C-w>c :%bw<CR>

" Select last edited or pasted text
nnoremap gV `[v`]

" Make Y act more consistently with other mappings
nnoremap Y y$
