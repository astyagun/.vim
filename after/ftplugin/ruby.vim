setlocal keywordprg=:Ri

command! -nargs=1 Ri call s:Ri("<args>")

function! s:Ri(kw) abort
  new
  silent execute "0r! ri -T -f markdown " . escape(a:kw, '#%<|:')
  0goto
  let b:ale_enabled = v:false
  setlocal filetype=markdown nospell buftype=nofile bufhidden=wipe noswapfile nomodifiable keywordprg=:Ri
endfunction
