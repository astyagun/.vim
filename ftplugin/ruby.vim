" Folding
if expand('%:t:r') !~ '_spec$'
  setlocal foldtext=ruby#foldtext()
endif

let s:middot = '·'

function! ruby#foldtext()
  let s:line = getline(v:foldstart)
  let s:preview_maxwidth = &columns - 7 - strdisplaywidth(s:stats()) - 2

  let s:preview = s:drop_trailing_do(s:line)[0:(s:preview_maxwidth - 1)]
  let s:preview = substitute(s:preview, '^\( *\)  ', '\1' . s:middot . ' ', '')

  let s:padding = repeat(s:middot, s:preview_maxwidth - strdisplaywidth(s:preview) + 1)
  let s:padding = substitute(s:padding, '\(^.\|.$\)', ' ', 'g')

  return s:preview . s:padding . s:stats() . ' ' . s:middot
endfunction

function! s:stats()
  let l:inner_block = range(v:foldstart + 1, prevnonblank(v:foldend) - 1)

  " Don't count blank lines or comments
  call filter(l:inner_block, "getline(v:val) !~# '^\\(\\W*$\\|\\s*\#\\)'")
  return '[' . len(l:inner_block) . ']'
endfunction

function! s:drop_trailing_do(str)
  return substitute(a:str, '\s\+do\( |.\+|\)\=$', '', '')
endfunction
