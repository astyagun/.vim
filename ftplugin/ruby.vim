compiler rails

let ruby_spellcheck_strings = 1

setlocal foldlevel=1
setlocal foldmethod=indent

" Don't fold small files
if line("$") <= &lines
  setlocal nofoldenable
endif
