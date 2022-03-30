function! s:SetColorscheme() abort
  highlight clear
  if exists('v:os_appearance') && v:os_appearance != 1
    set background=light
    colorscheme xcodelighthc
  else
    set background=dark
    colorscheme xcodedarkhc
  endif
  silent doautocmd User ColorSchemeChanged
  redraw!
endfunction

call s:SetColorscheme()

if exists('##OSAppearanceChanged')
  augroup OSAppearance
    autocmd!
    autocmd OSAppearanceChanged *
          \ call s:SetColorscheme()
          \| execute 'LightlineColorscheme ' . g:lightline.colorscheme
  augroup END
endif

augroup ColorSchemeChanged
  autocmd!
  autocmd User ColorSchemeChanged
        \ call s:ApplyCustomHighlights()
        \| call s:ApplyCustomColorschemeHighlights()
        \| call s:SetBatThemeEnvironmentVariable()
augroup END

function! s:ApplyCustomHighlights() abort
  " Highlight tabs and trailing spaces with red:		     
  highlight SpecialKey guifg=red

  " Hide tilde from empty lines after file contents
  highlight EndOfBuffer guifg=bg
endfunction

function! s:ApplyCustomColorschemeHighlights() abort
  highlight clear DiffText
  highlight clear Error

  if &background is# 'dark'
    highlight Visual guibg=#646F83
    highlight Search guifg=white guibg=#545558
    highlight Folded guifg=#dfdfe0
    highlight DiffText guifg=#dfdfe0 guibg=#675548
    highlight Error guifg=#ff0000 guibg=#7f180a
  else
    highlight clear Folded
    highlight link Folded StatusLineNC
    highlight clear DiffChange
    highlight DiffChange guibg=#fdfae6
    highlight DiffText guifg=#262626 guibg=#fef869
    highlight Error guifg=#ff0000 guibg=#ffbfbf
  endif
endfunction

function! s:SetBatThemeEnvironmentVariable() abort
  if &background ==? 'dark'
    let $BAT_THEME = 'Monokai Extended'
  else
    let $BAT_THEME = 'GitHub'
  endif
endfunction

" Create new buffer with examples of highlighting groups
command! HiTest source $VIMRUNTIME/syntax/hitest.vim
