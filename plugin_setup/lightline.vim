let g:lightline = {}
let g:lightline.colorscheme = 'solarized'

let g:lightline.active = {
      \   'left':  [['mode', 'paste'],
      \             ['readonly', 'filename', 'modified']],
      \   'right': [['asyncrun_status', 'lineinfo'],
      \             ['percent'],
      \             ['filetype', 'fileencoding']]
      \ }

let g:lightline.inactive = {
      \   'left':  [['filename']],
      \   'right': [['lineinfo'], ['percent']]
      \ }

let g:lightline.tabline = {
      \   'left':  [['tabs']],
      \   'right': [['close']]
      \ }

let g:lightline.component = {
      \   'asyncrun_status': '%{toupper(g:asyncrun_status)}'
      \ }

let g:lightline.component_expand = {
      \   'asyncrun_status': 'AsyncRunStatus'
      \ }

let g:lightline.component_type = {
      \   'asyncrun_status': 'error'
      \ }

let g:lightline.enable = {'statusline': 1, 'tabline': 0}

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

augroup LightlineReload
  autocmd!
  autocmd User ConfigurationReloaded
        \ call lightline#init() |
        \ call lightline#colorscheme() |
        \ call lightline#update()
augroup END
