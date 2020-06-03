augroup RubocopGx
  autocmd!
  autocmd BufNewFile,BufRead rubocop.yml,.rubocop.yml,.rubocop_todo.yml
        \ nnoremap <expr><buffer><silent> gx <SID>RubocopGx()
augroup END

" gx to open Rubocop cops documentation in a browser
function! s:RubocopGx() abort
  let l:cfile = expand('<cfile>')
  echom l:cfile
  if !filereadable(l:cfile) && l:cfile =~? '^\w\+/\w\+$'
    let [l:group, l:cop_name] = split(tolower(l:cfile), '/')
    if l:group ==# 'rails'
      let l:url = 'https://docs.rubocop.org/projects/rails/en/stable/cops_' . l:group . '/#' . l:group . l:cop_name
    elseif l:group ==# 'rspec' || l:group ==# 'capybara' || l:group ==# 'factorybot'
      let l:url = 'https://docs.rubocop.org/projects/rspec/en/stable/cops_' . l:group . '/#' . l:group . l:cop_name
    else
      let l:url = 'https://docs.rubocop.org/en/stable/cops_' . l:group . '/#' . l:group . l:cop_name
    endif
    call OpenInBrowser(l:url)
  else
    call OpenInBrowser('<cfile>')
  endif
endfunction
