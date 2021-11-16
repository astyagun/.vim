" See what current file looks like on the Docker side

command! ReadFileFromDocker call <SID>ReadFileFromDocker()

function! s:ReadFileFromDocker() abort
  " https://github.com/astyagun/.files/blob/master/bin/dkc-executable-container
  let l:container_name = systemlist('dkc-executable-container')[0]
  let l:current_column = col('.')
  let l:current_line   = line('.')
  let l:file_type      = &filetype

  new
  execute '0read !docker-compose exec ' . l:container_name . " cat '#'"
  $delete

  setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
  if !empty(l:file_type)
    execute 'setfiletype ' . l:file_type
  endif
  execute ':'            . l:current_line
  execute ':normal '     . l:current_column . '|'
  normal! zv
endfunction
