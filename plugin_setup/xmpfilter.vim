let g:xmpfilter_cmd = 'seeing_is_believing'

augroup XmpfileterRubyMaps
  autocmd!

  autocmd FileType ruby nmap <buffer> <Leader>rm <Plug>(seeing_is_believing-mark)
  autocmd FileType ruby xmap <buffer> <Leader>rm <Plug>(seeing_is_believing-mark)

  autocmd FileType ruby nmap <buffer> <Leader>rc <Plug>(seeing_is_believing-clean)
  autocmd FileType ruby xmap <buffer> <Leader>rc <Plug>(seeing_is_believing-clean)

  " xmpfilter compatible
  autocmd FileType ruby nmap <buffer> <Leader>rx <Plug>(seeing_is_believing-run_-x)
  autocmd FileType ruby xmap <buffer> <Leader>rx <Plug>(seeing_is_believing-run_-x)

  " auto insert mark at appropriate spot.
  autocmd FileType ruby nmap <buffer> <Leader>rr <Plug>(seeing_is_believing-run)
  autocmd FileType ruby xmap <buffer> <Leader>rr <Plug>(seeing_is_believing-run)
augroup END
