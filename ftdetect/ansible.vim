augroup AnsibileFtDetect
  autocmd!
  autocmd BufRead,BufNewFile *.yml call s:DetectAnsible()
augroup END

function! s:DetectAnsible() abort
  if filereadable('ansible.cfg')
    setf yaml.ansible
  endif
endfunction
