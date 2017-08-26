let g:lightline                  = {}
let g:lightline.colorscheme      = 'custom_solarized'
let g:lightline.component        = {}
let g:lightline.component_expand = {}
let g:lightline.component_type   = {}
let g:lightline.enable           = {'tabline': 0}

" Initial config
let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'readonly', 'filename', 'modified' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.inactive = {
      \ 'left': [ [ 'filename' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ] ] }

" Show file path
let g:lightline.active.left[1][1]   = 'relativepath'
let g:lightline.inactive.left[0][0] = 'relativepath'

" Don't show file format
call remove(g:lightline.active.right[2], 0)

" Show modified in inactive windows
call add(g:lightline.inactive.left[0], 'modified')

" AsyncRun
call insert(g:lightline.active.right[0], 'asyncrun', 0)

let g:lightline.component.asyncrun        = '%{toupper(g:asyncrun_status)}'
let g:lightline.component_expand.asyncrun = 'AsyncRunStatus'
let g:lightline.component_type.asyncrun   = 'error'

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
  autocmd User AsyncRunStart call lightline#update()
augroup END

" Reload Lightline when configuration is reloaded
augroup LightlineReload
  autocmd!
  autocmd User ConfigurationReloaded
        \ call lightline#init() |
        \ call lightline#colorscheme() |
        \ call lightline#update()
augroup END
