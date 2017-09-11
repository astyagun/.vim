colorscheme mac_classic

" Fix Error visibility when in cursor line
highlight Error guibg=#FFDDDD guifg=red gui=bold

" Highlight tabs and trailing spaces with red:		     
highlight SpecialKey guifg=red

" Highlight characters when line length is exceeded
" Test: Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Pink Test Test
augroup LineLengthColumn
  autocmd!
  " It requires late execution for some reason
  autocmd FileType * highlight link LineLengthColumn Error | call matchadd('LineLengthColumn', '\%111v', 100)
augroup END

highlight ColorColumn guibg=#F5F5F5

" Diff
highlight DiffAdd guibg=#DDFFDD
highlight DiffDelete guibg=#FFDDDD
highlight DiffChange guibg=#FFFFDD
highlight DiffText guibg=#FFFFAA

" Create new buffer with examples of highlighting groups
command! HiTest so $VIMRUNTIME/syntax/hitest.vim
