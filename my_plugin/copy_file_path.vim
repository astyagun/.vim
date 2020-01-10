command! -bang CopyFilePath call s:CopyFilePath(<bang>0, 0)
command! -bang CopyFilePathWithLineNumber call s:CopyFilePath(<bang>0, 1)

function! s:CopyFilePath(absolute_path, line_number) abort
  let l:file_path_variable = '%'
  if a:absolute_path
    let l:file_path_variable .= ':p'
  endif
  let l:result = expand(l:file_path_variable)

  if a:line_number
    let l:result .= ':' . line('.')
  endif

  let @+ = l:result
endfunction
