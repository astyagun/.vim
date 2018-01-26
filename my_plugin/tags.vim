augroup TagsGenerator
  autocmd!
  autocmd BufWritePost *.rb,*.ino,*.pde :silent !global -u &
augroup END
