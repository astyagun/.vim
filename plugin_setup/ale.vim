scriptencoding utf-8

let g:ale_biome_options            = "--indent-syle=space"
let g:ale_change_sign_column_color = 0
let g:ale_completion_enabled       = 1
let g:ale_echo_cursor              = 0
let g:ale_ruby_reek_show_wiki_link = 1
let g:ale_ruby_rubocop_options     = "--display-style-guide --parallel"
let g:ale_set_balloons             = 0
let g:ale_sign_column_always       = 0
let g:ale_sign_error               = "●"
let g:ale_sign_warning             = "●"

" Arduino and C/C++
let g:ale_c_build_dir_names = ["build-uno", "build", "bin"]

let g:ale_linter_aliases = {
      \   "arduino": "cpp",
      \ }
let g:ale_linters = {
      \   "javascript": ["biome"],
      \   "json": ["biome", "jq"],
      \   "ruby": ["solargraph", "ruby", "rubocop", "reek"],
      \   "typescript": ["biome"],
      \   "zsh":  ["shell", "shellcheck"],
      \ }
let g:ale_fixers = {
      \   "javascript": ["biome"],
      \   "json": ["biome", "jq"],
      \   "ruby": ["solargraph", "rubocop"],
      \   "typescript": ["biome"],
      \ }

function! s:ALERubocopFix() range abort
  execute a:firstline . "," . a:lastline . '!rubocop --auto-correct --stdin "%" | sed "1,/=\{20\}/d"'
  normal! gv=
endfunction

command! -range ALERubocopFix <line1>,<line2>call <SID>ALERubocopFix()

set omnifunc=ale#completion#OmniFunc

map <Leader>ll <Plug>(ale_lint)
map <Leader>lr <Plug>(ale_reset)
map <Leader>ld <Plug>(ale_detail)

" TODO
" map <Leader>cf :CocCommand editor.action.formatDocument<CR><Esc>
" autocmd FileType ruby,vim,cs nnoremap <buffer><silent> <D-g> :CocFzfList outline<CR>
" autocmd FileType ruby,vim,cs nnoremap <buffer><silent> K :call CocAction('doHover')<CR>
