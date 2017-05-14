if has('persistent_undo')
  let myUndoDir = expand('$HOME/.vim/undodir')

  " Create dir
  call system('mkdir ' . myUndoDir)

  let &undodir = myUndoDir
  set undofile
endif

nnoremap <Leader>ut :UndotreeToggle<cr>
