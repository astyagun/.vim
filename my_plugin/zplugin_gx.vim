" gx to open GitHub URLs in browser
function! s:zplugin_gx()
  if getline('.') =~# '\v^\s*(zpl|zplg|zplugin)\s+(load|light)\s'
    let l:cfile = expand('<cfile>')
    if !filereadable(l:cfile) && l:cfile !=# '\v(zpl|zplg|zplugin|load|light)'
      call OpenInBrowser('https://github.com/' . l:cfile)
    endif
  else
    call OpenInBrowser('<cfile>')
  endif
endfunction

augroup ZpluginGx
  autocmd!
  autocmd BufNewFile,BufRead *.zsh nnoremap <buffer> <silent> gx :call <SID>zplugin_gx()<cr>
augroup END
