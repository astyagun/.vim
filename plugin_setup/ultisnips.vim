let g:UltiSnipsExpandTrigger       = '<C-y><C-y>'
let g:UltiSnipsListSnippets        = '<C-y><C-n>'
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" Prevent premature <C-y> mapping triggering to make UltiSnips mappings work
" reliably
imap <C-y> <Nop>
