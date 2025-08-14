vim9script

augroup GemfileGx
  autocmd!
  autocmd BufNewFile,BufRead gems.rb,Gemfile,*.gemspec nnoremap <buffer><silent> gx :call <SID>GemfileGx()<CR>
augroup END

# gx to open Rubygems URLs in browser
def GemfileGx()
  var line = getline('.')
  var cfile = expand('<cfile>')

  if line =~# '^ *gem\s' || line =~# '^ *spec.add_dependency\s' || line =~# '^ *spec.add_development_dependency\s'
    if !empty(cfile) && cfile !=# 'gem' && cfile !=# 'spec.add_dependency' && cfile !=# 'spec.add_development_dependency'
      dist#vim9#Open('https://rubygems.org/gems/' .. cfile)
    endif
  else
    dist#vim9#Open(cfile)
  endif
enddef
