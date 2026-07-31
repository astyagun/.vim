setlocal keywordprg=:Ri

command! -nargs=1 Ri call s:Ri("<args>")

function! s:Ri(kw) abort
  new
  execute "0r! ri -T -f markdown " . a:kw
  0goto
  setlocal filetype=markdown nospell buftype=nofile bufhidden=wipe noswapfile nomodifiable
endfunction
