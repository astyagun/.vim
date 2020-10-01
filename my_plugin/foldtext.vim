let s:filler_char = '·'

function! g:FoldText() abort
  let l:line = getline(v:foldstart)
  let l:stats = s:Stats()
  let l:preview_maxwidth = &colorcolumn - strdisplaywidth(l:stats) - 1

  let l:preview = s:dropTrailingDo(l:line)
  let l:pre_padding = repeat(s:filler_char, indent(v:foldstart) - 1)
  if indent(v:foldstart) > 0
    let l:pre_padding .= " "
  endif
  let l:preview = substitute(l:preview, '^ *', l:pre_padding, '')
  let l:preview = s:RemoveCommentsAndMarkersFromPreview(l:preview)

  return l:preview . ' ' . l:stats . ' ' . s:filler_char
endfunction

function! s:Stats() abort
  let l:inner_block = range(v:foldstart + 1, prevnonblank(v:foldend) - 1)

  " Don't count blank lines
  call filter(l:inner_block, "getline(v:val) !~# '^\\s*$'")

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
