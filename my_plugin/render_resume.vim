command! RenderResume silent call <SID>RenderResume()

function! s:RenderResume() abort
  let l:winview = winsaveview()

  " Copy contents to a new buffer
  execute "normal! ggVGy\<C-w>np"
  " Delete note header
  normal! ggd2j
  write ~/Desktop/Anton\ Styagun\ -\ Resume.md
  make
  Remove

  call winrestview(l:winview)
endfunction
