vim9script

augroup ZinitGx
  autocmd!
  autocmd BufNewFile,BufRead *.zsh nnoremap <buffer><silent> gx :call <SID>ZinitGx()<CR>
augroup END

# gx to open GitHub URLs in browser
def ZinitGx()
  var cfile = expand('<cfile>')
  if getline('.') =~# '\v^\s*(zinit|zi|zpl|zplg|zplugin)\s+(load|light)\s'
    if !empty(cfile) && cfile !=# '\v(zinit|zi|zpl|zplg|zplugin|load|light|lucid)'
      dist#vim9#Open('https://github.com/' .. cfile)
    endif
  else
    dist#vim9#Open(cfile)
  endif
enddef
