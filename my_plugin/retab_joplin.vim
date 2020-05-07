command! RetabJoplin call <SID>RetabJoplin()

function! s:RetabJoplin() abort
  set noexpandtab tabstop=4
  retab!
  set expandtab tabstop=2
  retab!
endfunction
