" GNU Global 'omnifunc' for Ruby and JavaScript
augroup GlobalComplete
  autocmd!
  autocmd FileType coffee,eruby,haml,javascript,ruby setlocal omnifunc=GlobalComplete
augroup END

function! GlobalComplete(findstart, base)
  if a:findstart == 1
    return s:LocateCurrentWordStart()
  else
    return split(system('global -c ' . a:base), '\n')
  endif
endfunction

function! s:LocateCurrentWordStart()
  let l:line = getline('.')
  let l:start = col('.') - 1
  while l:start > 0 && l:line[l:start - 1] =~# '\a'
    let l:start -= 1
  endwhile
  return l:start
endfunction
