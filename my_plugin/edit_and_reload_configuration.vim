let s:vim_path = expand('~/.vim')
let $MYVIMRC   = s:vim_path . '/init.vim'
let $MYGVIMRC  = s:vim_path . '/ginit.vim'

if !exists('*ReloadConfiguration')
  function ReloadConfiguration() abort
    source $MYVIMRC
    if has('gui_running')
      source $MYGVIMRC
    endif
    redraw " Prevents redraw after echo, which would hide echoed messages
    echom 'Configuration reloaded'
    doautocmd User ConfigurationReloaded
  endfunction
endif

augroup ReloadConfiguration
  autocmd!
  autocmd BufWritePost .vimrc,*.vim call ReloadConfiguration()
augroup END

map <Leader>ve :edit $MYVIMRC<CR>
map <Leader>vp :edit <C-r>=fnamemodify(expand("$MYVIMRC"), ":p:h")<CR>/config/plug.vim<CR>
map <Leader>vs :call ReloadConfiguration()<CR>
