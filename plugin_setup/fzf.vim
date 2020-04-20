nnoremap <D-p> :Files<CR>
nnoremap <D-P> :Files <C-r>=expand('%:h')<CR><CR>
nnoremap <Leader><D-b> :Buffers<CR>

" Hide statusline in FZF buffer
augroup HideFZFStatusline
  autocmd!
  autocmd FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" Import FZF environment variables from the 'shell'

" Need to delay, because the 'shell' option is set later in the startup sequence
augroup DelayImportingEnvironmentVariables
  autocmd!
  autocmd VimEnter * call timer_start(1, { _ -> execute('call <SID>ImportFzfEnvironmentVariablesFromShell()') })
  autocmd User ConfigurationReloaded call s:ImportFzfEnvironmentVariablesFromShell()
augroup END

function! s:ImportFzfEnvironmentVariablesFromShell() abort
  for line in systemlist('env | grep "^FZF_"')
    let variable_string = split(line, '=')
    let variable_name = variable_string[0]
    let variable_value = join(variable_string[1:-1], '=')
    let escaped_variable_value = substitute(variable_value, '"', '\\"', 'g')

    execute 'let $' . variable_name . ' = "' . escaped_variable_value . '"'
  endfor

  if &background ==? 'dark'
    let $BAT_THEME = 'Monokai Extended'
  else
    let $BAT_THEME = 'GitHub'
  endif
  let $FZF_DEFAULT_OPTS = $FZF_DEFAULT_OPTS . ' --no-bold'
endfunction
