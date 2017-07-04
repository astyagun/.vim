" gx to open GitHub URLs in browser
function! s:plug_gx()
  if getline('.') =~ '^ *Plug\s'
    let cfile = expand('<cfile>')
    if !filereadable(cfile) && cfile != 'Plug'
      call OpenInBrowser('https://github.com/' . cfile)
    endif
  else
    call OpenInBrowser('<cfile>')
  endif
endfunction

augroup PlugGx
  autocmd!
  autocmd BufRead plug.vim nnoremap <buffer> <silent> gx :call <SID>plug_gx()<cr>
augroup END
