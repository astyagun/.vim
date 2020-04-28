if has('persistent_undo')
  let s:undodir_path = expand('$HOME/.vim/undodir')

  " Create dir
  if !isdirectory(s:undodir_path)
    call mkdir(s:undodir_path, 'p')
  endif

  let &undodir = s:undodir_path
  set undofile
endif

nnoremap <Leader>ut :UndotreeToggle<cr>
