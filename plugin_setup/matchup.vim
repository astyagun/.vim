let g:matchup_matchparen_enabled = v:false
let g:matchup_matchparen_offscreen = {}
let g:matchup_mouse_enabled = v:false

augroup MatchUpCustomization
  autocmd!
  autocmd User ColorSchemeChanged highlight MatchWord gui=NONE guifg=NONE guibg=NONE
augroup end
