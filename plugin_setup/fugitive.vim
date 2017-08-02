" Don't highlight tabs in Fugitive windows
augroup FugitiveHightlight
  autocmd!
  autocmd FileType gitcommit setlocal listchars-=tab:»» |
        \ setlocal listchars+=tab:\ \ 
augroup END

augroup FugitiveCommands
  autocmd!
  autocmd User Fugitive command! -buffer Greview :Git! diff --cached
augroup END
