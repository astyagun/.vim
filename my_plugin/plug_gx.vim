" gx to open GitHub URLs in browser
function! s:plug_gx()
  if getline('.') =~# '^ *Plug\s'
    let l:cfile = expand('<cfile>')
    if !filereadable(l:cfile) && l:cfile !=# 'Plug'
      call OpenInBrowser('https://github.com/' . l:cfile)
    endif
  else
    call OpenInBrowser('<cfile>')
  endif
endfunction

augroup PlugGx
  autocmd!
  autocmd BufNewFile,BufRead plug.vim nnoremap <buffer> <silent> gx :call <SID>plug_gx()<cr>
augroup END
