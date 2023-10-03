syntax case match
execute 'syntax keyword confluenceTodo ' . join(g:TodoVariations, ' ')
highlight link confluenceTodo Todo
