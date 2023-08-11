nnoremap <Leader>* /\<<C-r><C-w>\><CR><C-o>:grep <C-r><C-w> -w<CR>
nnoremap <Leader>g* /<C-r><C-w><CR><C-o>:grep <C-r><C-w><CR>
" Depends on custom `vmap *` from my_plugin/search_vmaps.vim
vmap <Leader>* *<C-o>:grep <C-r>/<CR>

" Sort search results by path
nnoremap <Leader># /\<<C-r><C-w>\><CR><C-o>:grep <C-r><C-w> -w --sort path<CR>
nnoremap <Leader>g# /<C-r><C-w><CR><C-o>:grep <C-r><C-w> --sort path<CR>
