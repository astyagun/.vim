scriptencoding utf-8

let g:ale_biome_options            = "--indent-style=space"
let g:ale_change_sign_column_color = 0
let g:ale_completion_enabled       = 1
let g:ale_echo_cursor              = 0
let g:ale_hover_cursor             = 0
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
" Ruby: disable Brakeman, that works on the whole project and is slow
" Zsh: has only "shell" by default
let g:ale_linters = {
      \   "ruby": ["ruby", "rubocop", "reek", "solargraph"],
      \   "zsh":  ["shell", "shellcheck", "bash-language-server"]
      \ }
" Is empty by default, has to be enabled explicitly
let g:ale_fixers = {
      \   "css":        ["biome"],
      \   "javascript": ["biome"],
      \   "json":       ["biome"],
      \   "jsonc":      ["biome"],
      \   "ruby":       ["rubocop"],
      \   "sql":        ["pgformatter"],
      \   "toml":       ["tombi_format"],
      \   "typescript": ["biome"],
      \ }

function! s:ALERubocopFix() range abort
  execute a:firstline . "," . a:lastline . '!rubocop --auto-correct --stdin "%" | sed "1,/=\{20\}/d"'
  normal! gv=
endfunction

command! -range ALERubocopFix <line1>,<line2>call <SID>ALERubocopFix()

set omnifunc=ale#completion#OmniFunc

" Enable completion in JSON {{{ "

" vscode-json-language-server advertises completion only when the client
" declares completionItem.snippetSupport, which ALE hardcodes to false, so ALE
" never sends textDocument/completion for JSON. Open the gate after the server
" starts, using ALE's public autoload API.
function! s:ALEJsonEnableCompletion() abort
  for [l:id, l:conn] in items(ale#lsp#GetConnections())
    if get(l:conn, "language", "") isnot# "json"
      continue
    endif

    if !ale#lsp#HasCapability(l:id, "completion")
      call ale#lsp#UpdateCapabilities(l:id, {
            \   "completionProvider": {"triggerCharacters": ["\"", ":"]},
            \ })
    endif
  endfor
endfunction

augroup ale_json_completion
  autocmd!
  autocmd User ALELSPStarted call <SID>ALEJsonEnableCompletion()
augroup END

" }}} Enable completion in JSON "

" Enable hover on K {{{ "

" Map K for hover once per buffer, only after a language server that reports
" hover support has connected for that buffer. Buffers without such a server
" keep the default K behaviour, and filetype plugins that map K themselves
" keep their mapping.
function! s:ALEMapHover() abort
  if get(b:, "ale_hover_mapped", 0)
    return
  endif

  let l:k_map = maparg("K", "n", v:false, v:true)

  if !empty(l:k_map) && l:k_map.buffer
    let b:ale_hover_mapped = 1

    return
  endif

  for [l:id, l:conn] in items(ale#lsp#GetConnections())
    if get(l:conn, "language", "") isnot# &filetype
    \|| !ale#lsp#HasCapability(l:id, "hover")
      continue
    endif

    let b:ale_hover_mapped = 1
    nmap <buffer><silent> K <Plug>(ale_hover)

    return
  endfor
endfunction

augroup ale_hover_map
  autocmd!
  autocmd User ALELSPStarted call <SID>ALEMapHover()
augroup END

" }}} Enable hover on K "

map <Leader>ll <Plug>(ale_lint)
map <Leader>lr <Plug>(ale_reset)
map <Leader>ld <Plug>(ale_detail)

" TODO
" map <Leader>cf :CocCommand editor.action.formatDocument<CR><Esc>
" autocmd FileType ruby,vim,cs nnoremap <buffer><silent> <D-g> :CocFzfList outline<CR>
" autocmd FileType ruby,vim,cs nnoremap <buffer><silent> K :call CocAction('doHover')<CR>
