let s:vim_path = expand('~/.vim')
let $MYVIMRC   = s:vim_path . '/init.vim'
let $MYGVIMRC  = s:vim_path . '/ginit.vim'

augroup ReloadConfiguration
  autocmd!
  autocmd BufWritePost .vimrc,*.vim call ReloadConfiguration()
augroup END

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

map <Leader>vs :call ReloadConfiguration()<CR>

augroup VimConfigMappings
  autocmd!
  autocmd User StartifyBufferOpened if s:IsInVimConfigDir() | call s:AddVimConfigMaps() | endif
augroup END

function! s:IsInVimConfigDir() abort
  return getcwd() == s:vim_path
endfunction

function! s:AddVimConfigMaps() abort
  map <Leader>ve :edit $MYVIMRC<CR>
  map <Leader>vp :edit <C-r>=fnamemodify(expand("$MYVIMRC"), ":p:h")<CR>/config/plug.vim<CR>
endfunction
