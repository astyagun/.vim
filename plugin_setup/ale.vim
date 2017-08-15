let g:ale_lint_delay = 2000
let g:ale_ruby_reek_show_wiki_link = 1
let g:ale_ruby_rubocop_options = '--rails --display-style-guide --parallel'
let g:ale_set_balloons = 0
let g:ale_sign_column_always = 1

" Fixes slowness
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_save = 0

" Fixes problem with double mappings in INSERT mode. Vim would not wait for
" double keystroke mapping and will fire a simgle keystroke mapping instead.
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

let g:ale_linters = {
      \   'ruby': [
      \     'ruby', 'rubocop', 'reek',
      \   ],
      \ }
let g:ale_fixers = {
      \   'ruby': [
      \     'rubocop',
      \   ],
      \ }

function! s:ALERubocopFix() range
  execute a:firstline . ',' . a:lastline . '!rubocop --auto-correct --stdin "%" | sed "1,/=\{20\}/d"'
  normal! gv=
endfunction

command! -range ALERubocopFix <line1>,<line2>call <SID>ALERubocopFix()

map <Leader>ll <Plug>(ale_lint):echom 'ALE running...'<CR>
augroup ALEJumpToFirstError
  autocmd!
  autocmd User ALELint if len(getloclist(0)) > 0 |
        \   ll |
        \   unsilent ALEDetail |
        \ else |
        \   unsilent echom 'ALE: no errors! 👍' |
        \ endif
augroup END

let g:ale_sign_warning = '●'
let g:ale_sign_error = '●'
