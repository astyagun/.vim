if !has('gui_running')
  finish
endif

set guioptions-=T " Hide toolbar
set guioptions-=e " Don't use graphical tabs to prevent decrease of `lines` by one when closing the second tab
set noballooneval
set guifont=JetBrains\ Mono:h13
set macligatures
set macthinstrokes

set columns=135
set lines=42
