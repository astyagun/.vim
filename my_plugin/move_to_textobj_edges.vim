" Move to text objects edges
" d stands for eDge, since ]e is already occupied by unimpaired
nmap <silent> [d :set operatorfunc=<SID>MoveToTextobjNearEdge<CR>g@
nmap <silent> ]d :set operatorfunc=<SID>MoveToTextobjFarEdge<CR>g@

" TODO: Make it work in operator pending mode

function! s:MoveToTextobjNearEdge(...)
  execute "normal! `["
endfunction

function! s:MoveToTextobjFarEdge(...)
  execute "normal! `]"
endfunction
