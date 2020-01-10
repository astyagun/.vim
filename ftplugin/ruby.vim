" Folding
setlocal foldtext=ruby#foldtext()

let s:middot = '·'
let s:raquo = '»'

function! ruby#foldtext() abort
  let l:line = getline(v:foldstart)
  let l:preview_maxwidth = &columns - 7 - strdisplaywidth(s:stats()) - 2

  let l:preview = s:drop_trailing_do(l:line)[0:(l:preview_maxwidth - 1)]
  let l:pre_padding = repeat(s:middot, strdisplaywidth(substitute(l:preview, '^\( *\).*', '\1', '')) - 2)
  let l:preview = substitute(l:preview, '^ *', s:raquo . l:pre_padding . ' ', '')

  let l:padding = repeat(s:middot, l:preview_maxwidth - strdisplaywidth(l:preview) + 1)
  let l:padding = substitute(l:padding, '\(^.\|.$\)', ' ', 'g')

  return l:preview . l:padding . s:stats() . ' ' . s:middot
endfunction

function! s:stats() abort
  let l:inner_block = range(v:foldstart + 1, prevnonblank(v:foldend) - 1)

  " Don't count blank lines or comments
  call filter(l:inner_block, "getline(v:val) !~# '^\\(\\W*$\\|\\s*\#\\)'")
  return '[' . len(l:inner_block) . ']'
endfunction

function! s:drop_trailing_do(str) abort
  return substitute(a:str, '\s\+do\( |.\+|\)\=$', '', '')
endfunction
