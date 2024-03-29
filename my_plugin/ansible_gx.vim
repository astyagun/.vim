augroup AnsibleGx
  autocmd!
  autocmd FileType yaml.ansible nnoremap <expr><buffer><silent> gx <SID>AnsibleGx()
augroup END

" gx to open Ansible documentation in browser
function! s:AnsibleGx() abort
  if getline('.') =~# '^[^#].*:'
    let l:cfile = expand('<cfile>')
    if !empty(l:cfile) && l:cfile !=# '-'
      if l:cfile !~# '://'
        call openbrowser#open('https://docs.ansible.com/ansible/latest/index.html#stp=1&stq=' . l:cfile)
      else
        call OpenInNetRW()
      endif
    endif
  else
    call OpenInNetRW()
  endif
endfunction
