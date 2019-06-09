nnoremap <D-p> :Files<CR>
nnoremap <D-P> :Files <C-r>=expand('%:h')<CR><CR>
nnoremap <Leader><D-b> :Buffers<CR>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

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
  autocmd VimEnter * call s:ImportFzfEnvironmentVariablesFromShell()
  autocmd User ConfigurationReloaded call s:ImportFzfEnvironmentVariablesFromShell()
augroup END

function! s:ImportFzfEnvironmentVariablesFromShell()
  for line in split(system('env | grep "^FZF_"'), '[[:cntrl:]]')
    let variable_string = split(line, '=')
    let variable_name = variable_string[0]
    let variable_value = join(variable_string[1:-1], '=')
    let escaped_variable_value = substitute(variable_value, '"', '\\"', 'g')

    execute 'let $' . variable_name . ' = "' . escaped_variable_value . '"'
  endfor
endfunction
