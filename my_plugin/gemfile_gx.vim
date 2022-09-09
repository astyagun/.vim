augroup GemfileGx
  autocmd!
  autocmd BufNewFile,BufRead Gemfile,*.gemspec nnoremap <expr><buffer><silent> gx <SID>GemfileGx()
augroup END

" gx to open Rubygems URLs in browser
function! s:GemfileGx() abort
  let l:line = getline('.')
  if l:line =~# '^ *gem\s' || l:line =~# '^ *spec.add_dependency\s' || l:line =~# '^ *spec.add_development_dependency\s'
    let l:cfile = expand('<cfile>')
    if !empty(l:cfile) && l:cfile !=# 'gem' && l:cfile !=# 'spec.add_dependency' && l:cfile !=# 'spec.add_development_dependency'
      call openbrowser#open('https://rubygems.org/gems/' . l:cfile)
    endif
  else
    call OpenInNetRW()
  endif
endfunction
