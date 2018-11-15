" gx to open Rubocop cops documentation in a browser
function! s:RubocopGx()
  let l:cfile = expand('<cfile>')
  if !filereadable(l:cfile) && l:cfile =~? '^\w\+/\w\+$'
    call OpenInBrowser('http://www.rubydoc.info/github/bbatsov/RuboCop/RuboCop/Cop/' . l:cfile)
  else
    call OpenInBrowser('<cfile>')
  endif
endfunction

augroup RubocopGx
  autocmd!
  autocmd BufNewFile,BufRead .rubocop.yml,.rubocop_todo.yml nnoremap <buffer> <silent> gx :call <SID>RubocopGx()<cr>
augroup END
