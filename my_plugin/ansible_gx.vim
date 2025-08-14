vim9script

augroup AnsibleGx
  autocmd!
  autocmd FileType yaml.ansible nnoremap <buffer><silent> gx :call <SID>AnsibleGx()<CR>
augroup END

# gx to open Ansible documentation in browser
def AnsibleGx()
  var cfile = expand('<cfile>')

  if getline('.') =~# '^[^#].*:'
    if !empty(cfile) && cfile !=# '-'
      if cfile !~# '://'
        dist#vim9#Open('https://docs.ansible.com/ansible/latest/index.html#stp=1&stq=' .. cfile)
      else
        dist#vim9#Open(cfile)
      endif
    endif
  else
    dist#vim9#Open(cfile)
  endif
enddef
