augroup ZinitGx
  autocmd!
  autocmd BufNewFile,BufRead *.zsh nnoremap <expr><buffer><silent> gx <SID>ZinitGx()
augroup END

" gx to open GitHub URLs in browser
function! s:ZinitGx() abort
  if getline('.') =~# '\v^\s*(zinit|zi|zpl|zplg|zplugin)\s+(load|light)\s'
    let l:cfile = expand('<cfile>')
    if !filereadable(l:cfile) && l:cfile !=# '\v(zinit|zi|zpl|zplg|zplugin|load|light|lucid)'
      call OpenInBrowser('https://github.com/' . l:cfile)
    endif
  else
    call OpenInBrowser('<cfile>')
  endif
endfunction
