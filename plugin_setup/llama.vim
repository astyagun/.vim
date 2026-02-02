augroup LlamaHighlights
  autocmd!
  autocmd User ColorSchemeChanged highlight link llama_hl_fim_hint Delimiter |
        \ highlight link llama_hl_fim_info Ignore |
        \ highlight link llama_hl_inst_src Delimiter |
        \ highlight link llama_hl_inst_info Comment |
        \ highlight link llama_hl_inst_virt_proc Ignore |
        \ highlight link llama_hl_inst_virt_gen Ignore |
        \ highlight link llama_hl_inst_virt_ready Ignore
augroup END

if !exists('g:llama_config')
  let g:llama_config = {}
endif

let g:llama_config.enable_at_startup = v:false
let g:llama_config.show_info = 0

let g:llama_config.keymap_debug_toggle    = "<Plug>Noop"
let g:llama_config.keymap_fim_accept_full = "<D-i>"
let g:llama_config.keymap_fim_accept_line = "<D-e>"
let g:llama_config.keymap_fim_accept_word = "<D-l>"
let g:llama_config.keymap_fim_trigger     = "<D-j>"
let g:llama_config.keymap_inst_accept     = "<Leader><D-i>"
let g:llama_config.keymap_inst_cancel     = "<Esc>"
let g:llama_config.keymap_inst_continue   = "<Leader><D-l>"
let g:llama_config.keymap_inst_rerun      = "<Leader><D-r>"
let g:llama_config.keymap_inst_trigger    = "<Leader><D-j>"

map <Leader>le :LlamaEnable<CR>
map <Leader>ld :LlamaDisable<CR>
