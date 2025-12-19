augroup LlamaHighlights
  autocmd!
  autocmd User ColorSchemeChanged highlight link llama_hl_hint Delimiter | highlight link llama_hl_info Ignore
augroup END

if !exists('g:llama_config')
  let g:llama_config = {}
endif

let g:llama_config.enable_at_startup = v:false
let g:llama_config.keymap_accept_word = "<C-x><C-H>"
let g:llama_config.keymap_trigger = "<C-X><C-X>"
let g:llama_config.show_info = 0

map <Leader>le :LlamaEnable<CR>
map <Leader>ld :LlamaDisable<CR>
