if !exists('*ReloadConfiguration')
  function ReloadConfiguration()
    source $MYVIMRC
    redraw " Prevents redraw after echo, which would hide echoed messages
    echom 'Reloaded ' . $MYVIMRC
    if has('gui_running')
      source $MYGVIMRC
      echom 'Reloaded ' . $MYGVIMRC
    endif
    AirlineRefresh
  endfunction
endif

augroup ReloadConfiguration
  autocmd!
  autocmd BufWritePost .vimrc,*.vim call ReloadConfiguration()
augroup END

map <Leader>ve :e $MYVIMRC<cr>
map <Leader>vs :call ReloadConfiguration()<CR>
