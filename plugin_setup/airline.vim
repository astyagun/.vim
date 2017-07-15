let g:airline#extensions#hunks#enabled     = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#xkblayout#enabled = 0 " Fixes lag
let g:airline_detect_spell                 = 0
let g:airline_powerline_fonts              = 1
let g:airline_theme                        = 'lucius'

" Make text color white in error section to make it distinguishable
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  for mode in keys(a:palette)
    let a:palette[mode]['airline_error'] = ['#ffffff', '#990000', 232, 160]
  endfor
endfunction

augroup AirlineSetup
  autocmd!
  autocmd VimEnter * let g:airline_section_error = airline#section#create_right([
      \ '%{airline#util#wrap(airline#extensions#ale#get_error(),0)}',
      \ '%{g:asyncrun_status != "success" ? toupper(g:asyncrun_status) : ""}'
      \ ])
augroup END
