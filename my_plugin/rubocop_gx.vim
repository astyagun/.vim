vim9script

augroup RubocopGx
  autocmd!
  autocmd BufNewFile,BufRead rubocop.yml,.rubocop.yml,.rubocop_todo.yml
        \ nnoremap <buffer><silent> gx :call <SID>RubocopGx()<CR>
augroup END

# gx to open Rubocop cops documentation in a browser
def RubocopGx()
  var cfile = expand('<cfile>')
  if !empty(cfile) && cfile =~? '^\w\+/\w\+$'
    var [group, cop_name] = split(tolower(cfile), '/')
    var url: string
    if group ==# 'rails' || group ==# "performance"
      url = 'https://docs.rubocop.org/rubocop-' .. group .. '/cops_' .. group .. '.html#' .. group .. cop_name
    elseif group ==# 'rspec' || group ==# 'capybara' || group ==# 'factorybot'
      url = 'https://docs.rubocop.org/rubocop-rspec/cops_' .. group .. '.html#' .. group .. cop_name
    else
      url = 'https://docs.rubocop.org/rubocop/cops_' .. group .. '.html#' .. group .. cop_name
    endif
    dist#vim9#Open(url)
  else
    dist#vim9#Open(cfile)
  endif
enddef
