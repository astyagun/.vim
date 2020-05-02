scriptencoding utf-8

let g:ale_change_sign_column_color = 0
let g:ale_echo_cursor = 0
let g:ale_ruby_reek_show_wiki_link = 0
let g:ale_ruby_rubocop_options = '--display-style-guide --parallel'
let g:ale_set_balloons = 0
let g:ale_sign_column_always = 0
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'

" Arduino and C/C++
let g:ale_c_build_dir_names = ['build-uno', 'build', 'bin']

" Fixes slowness
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_save = 0

" Fixes problem with double mappings in INSERT mode. Vim would not wait for
" double keystroke mapping and will fire a simgle keystroke mapping instead.
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

let g:ale_linter_aliases = {
      \   'arduino': 'cpp',
      \ }
let g:ale_linters = {
      \   'ruby': ['ruby', 'rubocop', 'reek'],
      \ }
let g:ale_fixers = {
      \   'ruby': ['rubocop'],
      \ }

function! s:ALERubocopFix() range abort
  execute a:firstline . ',' . a:lastline . '!rubocop --auto-correct --stdin "%" | sed "1,/=\{20\}/d"'
  normal! gv=
endfunction

command! -range ALERubocopFix <line1>,<line2>call <SID>ALERubocopFix()

map <Leader>ll <Plug>(ale_lint)
map <Leader>lr <Plug>(ale_reset)
map <Leader>ld <Plug>(ale_detail)
