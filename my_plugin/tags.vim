augroup TagsGenerator
  autocmd!
  autocmd BufWritePost * :silent AsyncRun ~/bin/generate-tags
augroup END
