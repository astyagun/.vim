let g:ale_linters = {'ruby': 'all'}
let g:ale_ruby_rubocop_options = '--rails --display-style-guide'
" TODO let g:ale_fixers.ruby = ?

function! s:ALERubocopFix() range
  execute a:firstline . ',' . a:lastline . '!rubocop --auto-correct --stdin "%" | sed "1,/=\{20\}/d"'
  normal gv=
endfunction

command! -range ALERubocopFix <line1>,<line2>call <SID>ALERubocopFix()
