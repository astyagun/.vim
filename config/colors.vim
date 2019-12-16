set termguicolors
highlight clear

let s:interface_style = systemlist('defaults read -g AppleInterfaceStyle')
if !empty(s:interface_style) && s:interface_style[0] ==? 'Dark'
  set background=dark
  colorscheme xcodedark
else
  set background=light
  colorscheme xcodelight
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
