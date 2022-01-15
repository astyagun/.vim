nnoremap K :call <SID>OpenAnsibleDoc()<CR>

function! s:OpenAnsibleDoc() abort
  let l:cword = expand("<cword>")
  if empty(l:cword)
    echoe "No <cword> found"
    return
  end

  new
  execute "0read !ansible-doc " . l:cword
  setlocal nofoldenable buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
  normal! gg0
endfunction
