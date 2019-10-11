highlight clear

if systemlist('defaults read -g AppleInterfaceStyle')[0] ==? 'dark'
  colorscheme darkblue

  highlight SignColumn guibg=NONE
  highlight StatusLine guibg=#808080
  highlight TabLine guifg=#808080 guibg=NONE gui=NONE
  highlight TabLineFill guifg=#000040
  highlight VertSplit guibg=#000040 guifg=#808080

  let g:fzf_colors['hl'] = ['fg', 'Statement']
  let g:fzf_colors['bg+'] = ['bg', 'Error']
else
  colorscheme mac_classic

  " Mac Classic colorscheme customization
  highlight CursorLineNR guibg=#F0F6FF
  highlight FoldColumn guibg=white
  highlight LineNr guibg=white
  highlight SignColumn guibg=white
  highlight TabLine guifg=#808080 guibg=White gui=NONE
  highlight TabLineFill guifg=White
  highlight TabLineSel guifg=#3C4C72
  highlight VertSplit guibg=white guifg=#CFCFCF

  " Fix Error visibility when in cursor line
  highlight Error guibg=#FFDDDD guifg=red gui=bold

  " Diff
  highlight DiffAdd guibg=#DDFFDD
  highlight DiffChange guibg=#FFFFDD
  highlight DiffDelete guibg=#FFDDDD
  highlight DiffText guibg=#FFFFAA

  " ColorColumn
  highlight ColorColumn guibg=#F5F5F5
endif

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
