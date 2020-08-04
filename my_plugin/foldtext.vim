let s:filler_char = '·'
let s:prefix_char = '+'

function! g:FoldText() abort
  let l:line = getline(v:foldstart)
  let l:preview_maxwidth = &columns - 7 - strdisplaywidth(s:Stats()) - 2

  let l:preview = s:dropTrailingDo(l:line)[0:(l:preview_maxwidth - 1)]
  let l:pre_padding = repeat(s:filler_char, strdisplaywidth(substitute(l:preview, '^\( *\).*', '\1', '')) - 2)
  let l:preview = substitute(l:preview, '^ *', s:prefix_char . l:pre_padding . ' ', '')
  let l:preview = s:RemoveCommentsAndMarkersFromPreview(l:preview)

  let l:padding = repeat(s:filler_char, l:preview_maxwidth - strdisplaywidth(l:preview) + 1)
  let l:padding = substitute(l:padding, '\(^.\|.$\)', ' ', 'g')

  return l:preview . l:padding . s:Stats() . ' ' . s:filler_char
endfunction

function! s:Stats() abort
  let l:inner_block = range(v:foldstart + 1, prevnonblank(v:foldend) - 1)

  " Don't count blank lines or comments
  call filter(l:inner_block, "getline(v:val) !~# '^\\(\\W*$\\|\\s*\#\\)'")
  return '[' . len(l:inner_block) . ']'
endfunction

function! s:dropTrailingDo(str) abort
  return substitute(a:str, '\s\+do\( |.\+|\)\=$', '', '')
endfunction

function! s:RemoveCommentsAndMarkersFromPreview(preview) abort
  let l:preview = substitute(a:preview, '" ', "", "g")
  let l:preview = substitute(l:preview, ' {{{', "", "g")
  return l:preview
endfunction
