map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" Compatibility with indexed-search plugin
let g:indexed_search_mappings = 0
nnoremap <silent>n nzv:ShowSearchIndex<CR>
nnoremap <silent>N Nzv:ShowSearchIndex<CR>
augroup incsearch-indexed
  autocmd!
  autocmd User IncSearchLeave ShowSearchIndex
augroup END
