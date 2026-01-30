let g:UltiSnipsExpandTrigger       = "<Plug>Noop"
let g:UltiSnipsListSnippets        = "<Plug>Noop"
let g:UltiSnipsJumpForwardTrigger  = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"

inoremap <silent> <C-x><C-i> <C-o>:call llama#fim_hide()<CR><C-r>=UltiSnips#ExpandSnippet()<CR>
snoremap <silent> <C-x><C-i> <Esc>:call llama#fim_fide()<CR>:call UltiSnips#ExpandSnippet()<CR>
