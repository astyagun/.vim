" Sort of replacement for multi cursors
" Source: comments at https://www.reddit.com/r/vim/comments/6vpleu/debate_why_would_i_need_multiple_cursors_in_vim/?st=j6rm9jef&sh=f715e0ab

" Change current word and search for the same word with possibility to apply the same edit to next occurences
" releatedly with a dot
nnoremap c*   *``cgn
nnoremap c#   *``cgN
nnoremap cg* g*``cgn
nnoremap cg# g*``cgN

" The same in VISUAL mode
xnoremap C y/<C-r>"<CR>``cgn

" After something was edited (or deleted, or yanked) repeat the same edit to the next occurence of the same
" text with possibility to apply the same edit to next occurences repeatedly with a dot
nnoremap <Leader>. :let @/=@"<CR>/<CR>cgn<C-r>.<ESC>
