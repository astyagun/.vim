augroup RubocopGx
  autocmd!
  autocmd BufNewFile,BufRead rubocop.yml,.rubocop.yml,.rubocop_todo.yml
        \ nnoremap <expr><buffer><silent> gx <SID>RubocopGx()
augroup END

" gx to open Rubocop cops documentation in a browser
function! s:RubocopGx() abort
  let l:cfile = expand('<cfile>')
  if !empty(l:cfile) && l:cfile =~? '^\w\+/\w\+$'
    let [l:group, l:cop_name] = split(tolower(l:cfile), '/')
    if l:group ==# 'rails' || l:group ==# "performance"
      let l:url = 'https://docs.rubocop.org/rubocop-' . l:group . '/cops_' . l:group . '.html#' . l:group . l:cop_name
    elseif l:group ==# 'rspec' || l:group ==# 'capybara' || l:group ==# 'factorybot'
      let l:url = 'https://docs.rubocop.org/rubocop-rspec/cops_' . l:group . '.html#' . l:group . l:cop_name
    else
      let l:url = 'https://docs.rubocop.org/rubocop/cops_' . l:group . '.html#' . l:group . l:cop_name
    endif
    call OpenInBrowser(l:url)
  else
    call OpenInBrowser('<cfile>')
  endif
endfunction
