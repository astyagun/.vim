" Find files and populate the quickfix list
command! -nargs=1 FindFiles call s:FindFiles(<q-args>)

function! s:FindFiles(filename)
  let l:error_file = tempname()
  silent execute '!rg --files ' . a:filename . ' | xargs file > ' . l:error_file
  set errorformat=%f:%m
  execute 'cfile ' . l:error_file
  copen
  call delete(l:error_file)
endfunction
