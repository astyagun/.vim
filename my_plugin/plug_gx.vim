augroup PlugGx
  autocmd!
  autocmd BufNewFile,BufRead plug.vim nnoremap <expr><buffer><silent> gx <SID>PlugGx()
augroup END

" gx to open GitHub URLs in browser
function! s:PlugGx() abort
  if getline('.') =~# '^"\? *Plug\s'
    let l:cfile = expand('<cfile>')
    if !empty(l:cfile) && l:cfile !=# 'Plug'
      call OpenInBrowser('https://github.com/' . l:cfile)
    endif
  else
    call OpenInBrowser('<cfile>')
  endif
endfunction
