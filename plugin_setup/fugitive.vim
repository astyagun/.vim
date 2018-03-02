" Don't highlight tabs in Fugitive windows
augroup FugitiveHightlight
  autocmd!
  autocmd FileType gitcommit setlocal listchars-=tab:»» |
        \ setlocal listchars+=tab:\ \ 
augroup END

augroup FugitiveCommands
  autocmd!
  autocmd User Fugitive command! -buffer Gdiff4 call <SID>Gdiff4()
augroup END

function! s:Gdiff4()
  Gdiff
  wincmd J
  2wincmd w
  Gdiff :1
endfunction
