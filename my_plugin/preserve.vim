function! Preserve(command) abort
  " Preparation: save last search, and cursor position
  let l:win_view = winsaveview()

  " Create new undo checkpoint
  execute "normal i\<C-g>u\<Esc>"
  " Do the business
  execute 'keepjumps ' . a:command

  " Clean up: restore previous search history, and cursor position
  call winrestview(l:win_view)
endfunction
