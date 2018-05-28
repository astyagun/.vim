colorscheme mac_classic

" Mac Classic colorscheme customization
highlight CursorLineNR guibg=#F0F6FF
highlight FoldColumn guibg=white
highlight LineNr guibg=white
highlight SignColumn guibg=white
highlight VertSplit guibg=white guifg=#CFCFCF
highlight TabLineFill guifg=LightGrey

" Signify plugin sign colors
highlight SignifySignAdd    gui=bold guibg=NONE guifg=#00BC41
highlight SignifySignChange gui=bold guibg=NONE guifg=brown
highlight SignifySignDelete gui=bold guibg=NONE guifg=red

" Fix Error visibility when in cursor line
highlight Error guibg=#FFDDDD guifg=red gui=bold

" Highlight tabs and trailing spaces with red:		     
highlight SpecialKey guifg=red

" Diff
highlight DiffAdd guibg=#DDFFDD
highlight DiffChange guibg=#FFFFDD
highlight DiffDelete guibg=#FFDDDD
highlight DiffText guibg=#FFFFAA

" Hide tilde from empty lines after file contents
highlight EndOfBuffer guifg=bg

" ColorColumn
highlight ColorColumn guibg=#F5F5F5

" Create new buffer with examples of highlighting groups
command! HiTest so $VIMRUNTIME/syntax/hitest.vim
