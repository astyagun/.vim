augroup TagsGenerator
  autocmd!
  autocmd BufWritePost * :silent !~/bin/generate-tags&
augroup END
