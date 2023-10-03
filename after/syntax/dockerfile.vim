syntax case match
execute 'syntax keyword dockerfileTodo containedin=dockerfileComment ' . join(g:TodoVariations, ' ')
highlight link dockerfileTodo Todo
