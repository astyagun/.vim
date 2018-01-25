function! InitializeCscope()
  set nocscopeverbose

  if filereadable('GTAGS')
    " Support Global
    set cscopeprg=/usr/local/bin/gtags-cscope
    cscope add GTAGS
  elseif filereadable('cscope.out')
    " Add any database in current directory
    cscope add cscope.out
  elseif $CSCOPE_DB != ""
    " Else add database pointed to by environment
    cscope add $CSCOPE_DB
  endif

  set cscopeverbose
endfunction

call InitializeCscope()

" Also InitializeCscope() is called on Startify session load: plugin_setup/startify.vim
