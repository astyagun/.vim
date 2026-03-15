let current_compiler = 'elm'

let s:cpo_save = &cpo
set cpo-=C

" Works like :setlocal, but allows quotes
let &l:makeprg = 'elm make "' . expand('%') . '" 2>&1'

let &cpo = s:cpo_save
unlet s:cpo_save
