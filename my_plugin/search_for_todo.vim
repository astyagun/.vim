execute "command! GrepTODO grep '" . join(g:TodoVariations, '\|') . "'"
execute 'command! FindTODO normal /' . join(g:TodoVariations, '\|') . '<CR>'
