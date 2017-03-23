let g:ale_ruby_rubocop_options = '--rails --display-style-guide'

function! s:ALEFix() range
  execute a:firstline . ',' . a:lastline . '!rubocop --auto-correct --stdin "%" | sed "1,/=\{20\}/d"'
  normal gv=
endfunction

command! -range ALEFix <line1>,<line2>call <SID>ALEFix()
