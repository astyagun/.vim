let g:lightline = {}
let g:lightline.colorscheme = 'solarized'
let g:lightline.enable = {'tabline': 0}

" AsyncRun status
let g:lightline.active = {}
let g:lightline.active.right = [
      \   ['asyncrun_status', 'lineinfo'],
      \   ['percent'],
      \   ['filetype', 'fileencoding']
      \ ]
let g:lightline.component        = {'asyncrun_status': '%{toupper(g:asyncrun_status)}'}
let g:lightline.component_expand = {'asyncrun_status': 'AsyncRunStatus'}
let g:lightline.component_type   = {'asyncrun_status': 'error'}

function! AsyncRunStatus()
  if g:asyncrun_status == 'success' || g:asyncrun_status == ''
    return false
  else
    return toupper(g:asyncrun_status)
  endif
endfunction

augroup AsyncRunUpdateLightline
  autocmd!
  autocmd User AsyncRunStop call lightline#update()
augroup END

" Reload Lightline when configuration is reloaded
augroup LightlineReload
  autocmd!
  autocmd User ConfigurationReloaded
        \ call lightline#init() |
        \ call lightline#colorscheme() |
        \ call lightline#update()
augroup END
