vim9script

augroup PlugGx
  autocmd!
  autocmd BufNewFile,BufRead plug.vim nnoremap <buffer><silent> gx :call <SID>PlugGx()<CR>
augroup END

# gx to open GitHub URLs in browser
def PlugGx()
  var cfile = expand('<cfile>')
  if getline('.') =~# '^"\? *Plug\s'
    if !empty(cfile) && cfile !=# 'Plug'
      dist#vim9#Open('https://github.com/' .. cfile)
    endif
  else
    dist#vim9#Open(cfile)
  endif
enddef
