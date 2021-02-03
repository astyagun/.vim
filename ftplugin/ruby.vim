compiler rails

" Folding
let ruby_fold            = 1
let ruby_foldable_groups = 'def do # __END__'

let ruby_spellcheck_strings = 1

if expand("%") =~# "_spec.rb$"
  setlocal foldlevel=1
endif
