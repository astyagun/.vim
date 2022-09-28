nnoremap g* /\<<C-r><C-w>\><CR><C-o>:grep -w <C-r><C-w><CR>
nnoremap <Leader>g* /<C-r><C-w><CR><C-o>:grep <C-r><C-w><CR>
" Depends on custom `vmap *` from my_plugin/search_vmaps.vim
vmap g* *<C-o>:grep <C-r>/<CR>
