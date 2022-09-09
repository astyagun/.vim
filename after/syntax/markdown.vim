syntax keyword mdTodo TODO FIXME
syntax cluster mkdNonListItem add=mdTodo
highlight link mdTodo Todo

syntax match mkdTodoListsDone '^\s*[-+*] \[[xX-]\].*'
highlight link mkdTodoListsDone Comment
