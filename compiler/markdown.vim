let current_compiler = 'markdown'

let s:cpo_save = &cpo
set cpo-=C

" Works like :setlocal, but allows quotes
let &l:makeprg = "pandoc -tHTML " . fnameescape(expand('%')) . " > ~/Desktop/" . fnameescape(expand("%:t:r")) . ".html"
setlocal errorformat=''

let &cpo = s:cpo_save
unlet s:cpo_save
