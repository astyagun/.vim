nmap <silent> [d :set operatorfunc=<SID>move_to_textobj_near_edge<CR>g@
nmap <silent> ]d :set operatorfunc=<SID>move_to_textobj_far_edge<CR>g@

function! s:move_to_textobj_near_edge(...)
  silent execute "normal! `["
endfunction

function! s:move_to_textobj_far_edge(...)
  silent execute "normal! `]"
endfunction
