scriptencoding utf-8

" Don't highlight tabs in Fugitive windows
augroup FugitiveHightlight
  autocmd!
  autocmd FileType gitcommit setlocal listchars-=tab:»» |
        \ setlocal listchars+=tab:\ \ 
augroup END
