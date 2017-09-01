omap ih <plug>(signify-motion-inner-pending)
xmap ih <plug>(signify-motion-inner-visual)
omap ah <plug>(signify-motion-outer-pending)
xmap ah <plug>(signify-motion-outer-visual)

augroup SignifyRefresh
  autocmd!
  autocmd User Fugitive SignifyRefresh
augroup END
