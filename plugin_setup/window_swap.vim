let g:windowswap_map_keys = 0

" Window - Mark
nnoremap <silent> <C-W>m :call WindowSwap#MarkWindowSwap()<CR>
" Window - eXchange
nnoremap <silent> <C-W>x :call WindowSwap#DoWindowSwap()<CR>
