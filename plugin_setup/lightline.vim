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

let g:lightline.active = {
      \   'left': [['mode', 'paste'], ['shrinkable_filename', 'fugitive_version'], ['readonly', 'modified']],
      \   'right': [['asyncrun', 'percent', 'total_lines'], ['lineinfo'], ['filetype']]
      \ }
let g:lightline.inactive = {
      \   'left': [['shrinkable_filename', 'fugitive_version', 'modified']],
      \   'right': [['percent', 'total_lines'], ['lineinfo']]
      \ }

" Show file path
let g:lightline.component_function['shrinkable_filename'] = 'CachedLightlineShrinkableFilename'

function! CachedLightlineShrinkableFilename()
  if !exists('b:lightline_shrinkable_filename_cached')
    let b:lightline_shrinkable_filename_cached = LightlineShrinkableFilename()
  endif
  return b:lightline_shrinkable_filename_cached
endfunction

augroup LightlineShrinkableFilename
  autocmd!
  autocmd BufRead,BufWritePost,VimResized * if exists('b:lightline_shrinkable_filename_cached') |
        \   unlet b:lightline_shrinkable_filename_cached |
        \ endif
augroup END

function! LightlineShrinkableFilename()
  let l:file_name = substitute(@%, '^fugitive://.*/\.git//\d/', '', '')
  let l:file_name_length = len(l:file_name)
  let l:window_width_without_file_name = winwidth(0) - l:file_name_length

  if l:file_name_length > 0
    if l:window_width_without_file_name >=
          \ s:min_window_width_and_file_name_length_difference_for_full_file_name
      return l:file_name
    else
      return expand('%:t')
    endif
  else
    return '[No Name]'
  end
endfunction

" Fugitive file version
let g:lightline.component_function['fugitive_version'] = 'LightlineFugitiveVersion'

function! LightlineFugitiveVersion()
  if @% =~# '^fugitive://'
    return ':' . matchstr(@%, '^fugitive://.*\.git//\zs\d\ze/')
  else
    return ''
  endif
endfunction

" Read only
let g:lightline.component_function['readonly'] = 'LightlineReadonly'

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

" Total lines count
let g:lightline.component.total_lines = '%L'

" AsyncRun
let g:lightline.component_expand.asyncrun = 'AsyncRunStatus'
let g:lightline.component_type.asyncrun   = 'error'

function! AsyncRunStatus()
  if g:asyncrun_status == 'success' || g:asyncrun_status == ''
    return ''
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
