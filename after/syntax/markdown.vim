syntax case match
execute 'syntax keyword mdTodo ' . join(g:TodoVariations, ' ')
syntax cluster mkdNonListItem add=mdTodo
highlight link mdTodo Todo

syntax match mkdTodoListDone '^\s*\zs[-+*] \[[xX]\].*$' containedin=mkdListItem
highlight link mkdTodoListDone Comment

syntax match mkdTodoListRejected '^\s*\zs[-+*] \[-\].*' containedin=mkdListItem
execute 'highlight mkdTodoListRejected gui=strikethrough guifg=' . synIDattr(synIDtrans(hlID('Comment')), 'fg', 'gui')
