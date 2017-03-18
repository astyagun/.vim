set laststatus=2
let g:airline_theme = 'lucius'
let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#xkblayout#enabled = 0 " Fixes lag
let g:airline#extensions#hunks#enabled = 0

" Make text color white in error section to make it distinguishable
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  for mode in keys(a:palette)
    let a:palette[mode]['airline_error'] = ['#ffffff', '#990000', 232, 160]
  endfor
endfunction
