augroup ImportPathFromShell
  autocmd!
  autocmd User ShellEnvironmentLoaded let $PATH = g:ShellEnvironment['PATH']
augroup end

