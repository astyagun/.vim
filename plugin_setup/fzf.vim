nnoremap <D-p> :Files<CR>
nnoremap <D-P> :Files <C-r>=expand('%:h')<CR><CR>
nnoremap <Leader><D-b> :Buffers<CR>

augroup HideFZFStatusline
  autocmd!
  autocmd FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

augroup ImportFzfEnvironmentVariablesFromShell
  autocmd!
  autocmd User ShellEnvironmentLoaded call s:ImportFzfEnvironmentVariablesFromShell()
augroup END

function! s:ImportFzfEnvironmentVariablesFromShell() abort
  for environment_variable_name in filter(keys(g:ShellEnvironment), 'v:val =~# "^FZF_"')
    let l:variable_value = g:ShellEnvironment[environment_variable_name]
    let l:escaped_variable_value = substitute(l:variable_value, '"', '\\"', 'g')

    execute 'let $' . environment_variable_name . ' = "' . l:escaped_variable_value . '"'
  endfor
endfunction
