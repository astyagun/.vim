compiler rails

" Folding
let ruby_fold            = 1
let ruby_foldable_groups = 'def do # __END__'

let ruby_spellcheck_strings = 1

let s:file_name = expand("%:t")
if s:file_name =~# "_spec.rb$" || s:file_name ==# "routes.rb"
  setlocal foldlevel=1
endif
