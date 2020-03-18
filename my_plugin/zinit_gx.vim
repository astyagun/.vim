" gx to open GitHub URLs in browser
function! s:zinit_gx() abort
  if getline('.') =~# '\v^\s*(zpl|zplg|zplugin)\s+(load|light)\s'
    let l:cfile = expand('<cfile>')
    if !filereadable(l:cfile) && l:cfile !=# '\v(zinit|zi|zpl|zplg|zplugin|load|light|lucid)'
      call OpenInBrowser('https://github.com/' . l:cfile)
    endif
  else
    call OpenInBrowser('<cfile>')
  endif
endfunction

augroup ZinitGx
  autocmd!
  autocmd BufNewFile,BufRead *.zsh nnoremap <buffer><silent> gx :call <SID>zinit_gx()<cr>
augroup END
