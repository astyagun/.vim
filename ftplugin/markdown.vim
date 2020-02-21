setlocal spell
setlocal nofoldenable
compiler markdown

nnoremap <buffer><silent> <Space> :call <SID>MarkdownChecklistToggle()<CR>

function! s:MarkdownChecklistToggle() abort
  let l:current_line = getline('.')

  if l:current_line =~# '^\s*[-+*] \[[xX]\] '
    " Uncheck checked
    substitute/ \[[xX]\] / \[ \] /
  else
    if l:current_line =~# '^\s*[-+*] \[ \] '
      " Check unchecked
      substitute/ \[ \] / \[x\] /
    else
      if l:current_line =~# '^\s*[-+*] '
        " Add uncheckined, when there's no check box yet
        substitute/^\(\s*[-+*]\) /\1 \[ \] /
      endif
    endif
  endif
endfunction
