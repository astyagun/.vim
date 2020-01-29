command! WipeHiddenBuffers call s:WipeHiddenBuffers()
map <Leader><C-w>C :WipeHiddenBuffers<CR>

function! s:WipeHiddenBuffers() abort
  let l:open_buffers = []

  for i in range(tabpagenr('$'))
    call extend(l:open_buffers, tabpagebuflist(i + 1))
  endfor

  let l:closed_count = 0
  for buffer_number in range(1, bufnr('$') + 1)
    if buflisted(buffer_number) && index(l:open_buffers, buffer_number) == -1
      execute 'bwipe ' . buffer_number
      let l:closed_count += 1
    endif
  endfor

  echom l:closed_count . ' hidden buffers wiped out'
endfunction
