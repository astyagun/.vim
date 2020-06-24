let g:signify_sign_add               = '▐'
let g:signify_sign_change            = '▐'
let g:signify_sign_delete            = '◢'
let g:signify_sign_delete_first_line = '◥'
let g:signify_sign_show_count        = 0

omap ih <plug>(signify-motion-inner-pending)
xmap ih <plug>(signify-motion-inner-visual)
omap ah <plug>(signify-motion-outer-pending)
xmap ah <plug>(signify-motion-outer-visual)
