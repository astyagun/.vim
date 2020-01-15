set termguicolors
highlight clear

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

function! s:SetColorscheme() abort
  if v:os_appearance == 1
    set background=dark
    colorscheme xcodedark
  else
    set background=light
    colorscheme xcodelight
  endif
  execute 'LightlineColorscheme ' . g:lightline.colorscheme
  call s:ApplyCustomHighlights()
  redraw!
endfunction

call s:SetColorscheme()

augroup OSAppearance
  autocmd!
  autocmd OSAppearanceChanged * call s:SetColorscheme()
augroup END

" Create new buffer with examples of highlighting groups
command! HiTest so $VIMRUNTIME/syntax/hitest.vim
