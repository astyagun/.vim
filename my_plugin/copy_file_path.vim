command! -bang CopyFilePath call s:CopyFilePath(<bang>0)

function! s:CopyFilePath(absolute_path)
  let l:file_path_variable = '%'
  if a:absolute_path
    let l:file_path_variable .= ':p'
  endif
  let @+ = expand(l:file_path_variable)
endfunction
