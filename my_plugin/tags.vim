augroup TagsGenerator
  autocmd!
  autocmd BufWritePost *.rb :silent AsyncRun ~/bin/generate-tags
augroup END
