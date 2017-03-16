" Highlight tabs and trailing spaces with red:		     
highlight SpecialKey guifg=red

" Highlight characters when line length is exceeded
" Test: Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Pink Test Test
highlight ColorColumn guibg=pink
call matchadd('ColorColumn', '\%111v', 100)

" Create new buffer with examples of highlighting groups
command! HiTest so $VIMRUNTIME/syntax/hitest.vim
