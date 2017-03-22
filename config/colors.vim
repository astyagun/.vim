colorscheme mac_classic

" Fix Error visibility when in cursor line
highlight Error guibg=#FFDDDD guifg=red gui=bold

" Highlight tabs and trailing spaces with red:		     
highlight SpecialKey guifg=red

" Highlight characters when line length is exceeded
" Test: Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Pink Test Test
call matchadd('ColorColumn', '\%111v', 100)
highlight clear ColorColumn
highlight link ColorColumn Error

" Diff
highlight DiffAdd guibg=#DDFFDD
highlight DiffDelete guibg=#FFDDDD
highlight DiffChange guibg=#FFFFDD
highlight DiffText guibg=#FFFFAA

" Create new buffer with examples of highlighting groups
command! HiTest so $VIMRUNTIME/syntax/hitest.vim
