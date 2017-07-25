let g:ale_ruby_rubocop_options = '--rails --display-style-guide'
let g:ale_sign_column_always = 1
" This causes slowness when opening files
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0

" Fixes problem with double mappings in INSERT mode. Vim would not way for
" double keystroke mapping and will fire a simgle keystroke mapping instead.
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

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
