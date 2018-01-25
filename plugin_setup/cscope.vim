if has('cscope')
  set nocsverb
  " add any database in current directory
  if filereadable('cscope.out')
    cs add cscope.out
    " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
endif
