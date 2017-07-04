" gx to open Rubygems URLs in browser
function! s:GemfileGx()
  let line = getline('.')
  if line =~ '^ *gem\s' || line =~ '^ *spec.add_dependency\s' || line =~ '^ *spec.add_development_dependency\s'
    echom 'Gx'
    let cfile = expand('<cfile>')
    if !filereadable(cfile) && cfile != 'gem' && cfile != 'spec.add_dependency' && cfile != 'spec.add_development_dependency'
      call OpenInBrowser('https://rubygems.org/gems/' . cfile)
    endif
  else
    call OpenInBrowser('<cfile>')
  endif
endfunction

augroup GemfileGx
  autocmd!
  autocmd BufRead Gemfile,*.gemspec nnoremap <buffer> <silent> gx :call <SID>GemfileGx()<cr>
augroup END
