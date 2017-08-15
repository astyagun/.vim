" This is more conveinent as ~/.vim/ is a Git repo and Fugitive sees repository only if editing a file in that directory
let s:vim_path = expand('~/.vim')
let $MYVIMRC   = s:vim_path . '/init.vim'
let $MYGVIMRC  = s:vim_path . '/ginit.vim'

if !exists('*ReloadConfiguration')
  function ReloadConfiguration()
    source $MYVIMRC
    redraw " Prevents redraw after echo, which would hide echoed messages
    echom 'Reloaded ' . $MYVIMRC
    if has('gui_running')
      source $MYGVIMRC
      echom 'Reloaded ' . $MYGVIMRC
    endif
    doautocmd User ConfigurationReloaded
  endfunction
endif

augroup ReloadConfiguration
  autocmd!
  autocmd BufWritePost .vimrc,*.vim call ReloadConfiguration()
augroup END

map <Leader>ve :edit $MYVIMRC<CR>
map <Leader>vs :call ReloadConfiguration()<CR>
