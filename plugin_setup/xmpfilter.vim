let g:xmpfilter_cmd = 'xmpfilter -a'

augroup XmpfileterRubyMaps
  autocmd!
  autocmd FileType ruby call <SID>AddXmpfilterMappings()
augroup END

function s:AddXmpfilterMappings() abort
  nmap <buffer> <Leader>rm <Plug>(xmpfilter-mark)
  xmap <buffer> <Leader>rm <Plug>(xmpfilter-mark)

  nmap <buffer> <Leader>rx <Plug>(xmpfilter-run)
  xmap <buffer> <Leader>rx <Plug>(xmpfilter-run)
endfunction
