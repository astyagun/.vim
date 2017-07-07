augroup TagsGenerator
  autocmd!
  autocmd BufWritePost *.rb :silent !~/bin/generate-tags&
augroup END
