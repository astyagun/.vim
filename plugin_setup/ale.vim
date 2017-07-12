let g:ale_linters = {'ruby': 'all'}
let g:ale_ruby_rubocop_options = '--rails --display-style-guide'
let g:ale_sign_column_always = 1

let g:ale_fixers = {
      \   'ruby': [
      \     'rubocop',
      \   ],
      \ }

function! s:ALERubocopFix() range
  execute a:firstline . ',' . a:lastline . '!rubocop --auto-correct --stdin "%" | sed "1,/=\{20\}/d"'
  normal gv=
endfunction

command! -range ALERubocopFix <line1>,<line2>call <SID>ALERubocopFix()
