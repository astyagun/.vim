function! s:LoadShellEnvironment() abort
  let g:ShellEnvironment = {}
  for shell_environment_variable in systemlist('env')
    let [l:variable_name, l:variable_value] = split(shell_environment_variable, '^\w*\zs=', v:true)
    let g:ShellEnvironment[l:variable_name] = l:variable_value
  endfor
  if exists('#User#ShellEnvironmentLoaded')
    doautocmd User ShellEnvironmentLoaded
  endif
endfunction

augroup LoadShellEnvironment
  autocmd!
  autocmd VimEnter * call timer_start(1, { _ -> execute('call <SID>LoadShellEnvironment()') })
  autocmd User ConfigurationReloaded call s:LoadShellEnvironment()
augroup end
