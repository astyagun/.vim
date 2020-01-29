" Capture output of Vim command into a new buffer
function! CaptureMessage(cmd) abort
  redir => message
  silent execute a:cmd
  redir END

  if empty(message)
    echoerr "No output"
  else
    " Use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    new
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction

command! -nargs=+ -complete=command CaptureMessage call CaptureMessage(<q-args>)
