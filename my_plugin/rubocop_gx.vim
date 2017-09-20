" gx to open Rubocop cops documentation in a browser
function! s:RubocopGx()
  let l:cfile = expand('<cfile>')
  if !filereadable(l:cfile) && l:cfile =~? '^\w\+/\w\+$'
    call OpenInBrowser('http://www.rubydoc.info/github/bbatsov/RuboCop/RuboCop/Cop/' . cfile)
  else
    call OpenInBrowser('<cfile>')
  endif
endfunction

augroup RubocopGx
  autocmd!
  autocmd FileType ruby nnoremap <buffer> <silent> gx :call <SID>RubocopGx()<cr>
augroup END
