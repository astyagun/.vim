augroup TagsGenerator
  autocmd!
  autocmd BufWritePost *.rb,*.ino,*.pde :silent !~/.vim/runtime/generate-tags&
augroup END
