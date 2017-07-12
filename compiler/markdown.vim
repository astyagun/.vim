let current_compiler = 'markdown'

let s:cpo_save = &cpo
set cpo-=C

" Works like :setlocal, but allows quotes
let &l:makeprg = 'gimli -stylesheet ~/gimli.css -outputdir ~/Desktop/ -file "' . expand('%') . '"'
setlocal errorformat=''

let &cpo = s:cpo_save
unlet s:cpo_save
