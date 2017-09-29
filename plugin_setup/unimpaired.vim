augroup UnimpairedUnmapExtra
  autocmd!
  autocmd VimEnter * call <SID>UnmapUnimpairedmappings()
augroup END

function! s:UnmapUnimpairedmappings()
  nunmap =ob
  nunmap =oc
  nunmap =od
  nunmap =oh
  nunmap =oi
  nunmap =ol
  nunmap =on
  nunmap =or
  nunmap =os
  nunmap =ou
  nunmap =ov
  nunmap =ow
  nunmap =ox
  nunmap =p
  nunmap =P
endfunction
