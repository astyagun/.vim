" Grep for word under cursor
nnoremap <Leader>* /\<<C-r><C-w>\><CR><C-o>:grep <C-r><C-w> -w<CR>
" Grep for word under cursor, also allow inclusion of it in other words
nnoremap <Leader>g* /<C-r><C-w><CR><C-o>:grep <C-r><C-w><CR>
" Grep for selection
" Depends on custom `vmap *` from my_plugin/search_vmaps.vim
vmap <Leader>* *<C-o>:grep <C-r>/<CR>

" Sort search results by path
" Grep for word under cursor
nnoremap <Leader># /\<<C-r><C-w>\><CR><C-o>:grep <C-r><C-w> -w --sort path<CR>
" Grep for word under cursor, also allow inclusion of it in other words
nnoremap <Leader>g# /<C-r><C-w><CR><C-o>:grep <C-r><C-w> --sort path<CR>
" Grep for definition of Ruby method
augroup RubyGrepMap
  autocmd!
  autocmd FileType ruby nnoremap <buffer> <Leader><C-]> /\<<C-r><C-w>\><CR><C-o>:grep 'def (self\.)?<C-r><C-w>' -w<CR>
augroup END

