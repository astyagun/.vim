" gx to open Rubocop cops documentation in a browser
function! s:RubocopGx() abort
  let l:cfile = expand('<cfile>')
  if !filereadable(l:cfile) && l:cfile =~? '^\w\+/\w\+$'
    let [l:group, l:cop_name] = split(tolower(l:cfile), '/')
    call OpenInBrowser('https://docs.rubocop.org/en/stable/cops_' . l:group . '/#' . l:group . l:cop_name)
  else
    call OpenInBrowser('<cfile>')
  endif
endfunction

augroup RubocopGx
  autocmd!
  autocmd BufNewFile,BufRead .rubocop.yml,.rubocop_todo.yml nnoremap <buffer> <silent> gx :call <SID>RubocopGx()<cr>
augroup END
