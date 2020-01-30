set termguicolors

function! s:SetColorscheme() abort
  highlight clear
  if v:os_appearance == 1
    set background=dark
    colorscheme xcodedark
  else
    set background=light
    colorscheme xcodelight
  endif
  doautocmd User ColorSchemeChanged
  redraw!
endfunction

call s:SetColorscheme()

augroup OSAppearance
  autocmd!
  autocmd OSAppearanceChanged *
        \ call s:SetColorscheme() |
        \ execute 'LightlineColorscheme ' . g:lightline.colorscheme
augroup END

augroup ColorSchemeChanged
  autocmd!
  autocmd User ColorSchemeChanged
        \ call s:ApplyCustomHighlights() |
        \ call s:ApplyCustomColorschemeHighlights()
augroup END

function! s:ApplyCustomHighlights() abort
  " Signify plugin sign colors
  highlight SignifySignAdd    gui=NONE guibg=NONE guifg=#00BC41
  highlight SignifySignChange gui=NONE guibg=NONE guifg=brown
  highlight SignifySignDelete gui=NONE guibg=NONE guifg=red

  " Highlight tabs and trailing spaces with red:		     
  highlight SpecialKey guifg=red

  " Hide tilde from empty lines after file contents
  highlight EndOfBuffer guifg=bg
endfunction

function! s:ApplyCustomColorschemeHighlights() abort
  if &background is 'dark'
    " Add more contrast
    highlight Visual guibg=#646F83
    highlight Search guifg=white guibg=#545558
  endif
endfunction

" Create new buffer with examples of highlighting groups
command! HiTest so $VIMRUNTIME/syntax/hitest.vim
