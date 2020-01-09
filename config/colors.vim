set termguicolors
highlight clear

function! s:SetColorscheme()
  if v:os_appearance == 1
    set background=dark
    colorscheme xcodedark
  else
    set background=light
    colorscheme xcodelight
  endif
  redraw!
endfunction

call s:SetColorscheme()

augroup OSAppearance
  autocmd!
  autocmd OSAppearanceChanged * call s:SetColorscheme()
augroup END

" Signify plugin sign colors
highlight SignifySignAdd    gui=bold guibg=NONE guifg=#00BC41
highlight SignifySignChange gui=bold guibg=NONE guifg=brown
highlight SignifySignDelete gui=bold guibg=NONE guifg=red

" Highlight tabs and trailing spaces with red:		     
highlight SpecialKey guifg=red

" Hide tilde from empty lines after file contents
highlight EndOfBuffer guifg=bg

" Create new buffer with examples of highlighting groups
command! HiTest so $VIMRUNTIME/syntax/hitest.vim
