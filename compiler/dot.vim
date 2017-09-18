let current_compiler = 'dot'

let s:cpo_save = &cpo
set cpo-=C

" Works like :setlocal, but allows quotes
let &l:makeprg = 'dot -Tpng "' . expand('%') . '" -o "' . expand('%:r') . '.png" 2>&1'

let &cpo = s:cpo_save
unlet s:cpo_save

