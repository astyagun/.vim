syntax case match
execute 'syntax match shTodo contained /\<\%(' . join(g:TodoVariations, '\|') . '\)\ze:\=\>/'
