command! ReadFileFromDocker call <SID>ReadFileFromDocker()

function! s:ReadFileFromDocker()
  let l:file_type      = &filetype
  let l:current_line   = line('.')
  let l:current_column = col('.')

  new
  0read !docker-compose exec spring cat '#'

  execute 'setfiletype ' . l:file_type
  execute ':'            . l:current_line
  execute ':normal '     . l:current_column . '|'
endfunction
