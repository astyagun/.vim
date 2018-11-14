augroup TagsGenerator
  autocmd!
  autocmd BufWritePost *.rb,*.ino,*.pde :silent !pgrep -x gtags || global -u &
augroup END
