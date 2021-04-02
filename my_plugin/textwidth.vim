" Set per-project 'textwidth' and 'colorcolumn' based on Rubocop LineLength

let s:default_line_length = 120

" function! RubocopLineLength() {{{

function! RubocopLineLength() abort
  if !filereadable(".rubocop.yml")
    return s:default_line_length
  endif

  let l:result = system('rg --multiline "(?s)Layout/LineLength:.+?^\S" .rubocop.yml | rg Max | cut -d: -f2')
  if v:shell_error || empty(l:result)
    return s:default_line_length
  endif

  return str2nr(l:result)
endfunction

" }}} function! RubocopLineLength()

" function! SetTextwidth() {{{

function! SetTextwidth() abort
  windo execute 'set textwidth=' . RubocopLineLength()
endfunction

" }}} function! SetTextwidth()

call SetTextwidth()

augroup SetTextwidth
  autocmd!
  autocmd User StartifyBufferOpened,ConfigurationReloaded call SetTextwidth()
augroup END
