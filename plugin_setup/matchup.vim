let g:matchup_matchparen_offscreen = {}

augroup MatchUpCustomization
  autocmd!
  autocmd User ColorSchemeChanged highlight MatchWord gui=NONE guifg=NONE guibg=NONE
augroup end
