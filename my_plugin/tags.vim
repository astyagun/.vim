augroup TagsGenerator
  autocmd!
  autocmd BufWritePost *.rb :silent !~/.vim/runtime/generate-tags&
augroup END
