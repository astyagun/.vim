let g:lightline                    = {}
let g:lightline.colorscheme        = 'custom_solarized'
let g:lightline.component          = {}
let g:lightline.component_expand   = {}
let g:lightline.component_function = {}
let g:lightline.component_type     = {}
let g:lightline.enable             = {'tabline': 0}
let g:lightline.separator          = {'left': '', 'right': ''}
let g:lightline.subseparator       = {'left': '|', 'right': '|'}

let s:min_window_width_and_file_name_length_difference_for_full_file_name = 55

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
let g:lightline.active.left[1][1]   = 'shrinkable_filename'
let g:lightline.inactive.left[0][0] = 'shrinkable_filename'

let g:lightline.component_function['shrinkable_filename'] = 'LightlineShrinkableFilename'

function! LightlineShrinkableFilename()
  let l:file_name = expand('%')
  let l:window_width_without_file_name = winwidth(0) - len(l:file_name)

  if len(l:file_name) > 0
    if l:window_width_without_file_name >=
          \ s:min_window_width_and_file_name_length_difference_for_full_file_name
      return expand('%')
    else
      return expand('%:t')
    endif
  else
    return '[No Name]'
  end
endfunction

" Remove extra file info components
call remove(g:lightline.active.right[2], 'fileencoding')
call remove(g:lightline.active.right[2], 'fileformat')

" Show modified in inactive windows
call add(g:lightline.inactive.left[0], 'modified')

" Swap places of right sections
let s:old_right_0 = g:lightline.active.right[0]
let g:lightline.active.right[0] = g:lightline.active.right[1]
let g:lightline.active.right[1] = s:old_right_0
let s:old_right_0 = g:lightline.inactive.right[0]
let g:lightline.inactive.right[0] = g:lightline.inactive.right[1]
let g:lightline.inactive.right[1] = s:old_right_0

" Total lines count
call add(g:lightline.active.right[0], 'total_lines')
call add(g:lightline.inactive.right[0], 'total_lines')
let g:lightline.component.total_lines = '%L'

" AsyncRun
call insert(g:lightline.active.right[0], 'asyncrun', 0)

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
