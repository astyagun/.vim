scriptencoding utf-8

let g:lightline                    = {}
let g:lightline.colorscheme        = 'one'
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
      \   'right': [
      \     [
      \       'asyncrun_failure',
      \       'linter_errors',
      \       'linter_warnings',
      \       'asyncrun_running',
      \       'percent',
      \       'total_lines',
      \     ],
      \     ['lineinfo'],
      \     ['fileformat', 'filetype']
      \   ]
      \ }
let g:lightline.inactive = {
      \   'left': [['shrinkable_filename', 'fugitive_version'], ['modified']],
      \   'right': [['percent', 'total_lines'], ['lineinfo'], ['fileformat', 'filetype']]
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
      return pathshorten(expand('%:f'))
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
call extend(g:lightline.component_expand, {
      \   'asyncrun_failure': 'AsyncRunFailure',
      \   'asyncrun_running': 'AsyncRunRunning',
      \ })
call extend(g:lightline.component_type, {
      \   'asyncrun_failure': 'error',
      \   'asyncrun_running': 'warning',
      \ })

function! AsyncRunFailure()
  if g:asyncrun_status ==# 'failure'
    return toupper(g:asyncrun_status)
  else
    return ''
  endif
endfunction

function! AsyncRunRunning()
  if g:asyncrun_status ==# 'running'
    return toupper(g:asyncrun_status)
  else
    return ''
  endif
endfunction

augroup AsyncRunUpdateLightline
  autocmd!
  autocmd User AsyncRunStop call lightline#update()
  autocmd User AsyncRunStart call lightline#update()
augroup END

" ALE
call extend(g:lightline.component_expand, {
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_warnings': 'LightlineLinterWarnings',
      \ })
call extend(g:lightline.component_type, {
      \   'linter_errors': 'error',
      \   'linter_warnings': 'warning',
      \ })

augroup ALEUpdateLightline
  autocmd!
  autocmd User ALELint call lightline#update()
augroup END

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_errors == 0 ? '' : printf('%d E', l:all_errors)
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_non_errors == 0 ? '' : printf('%d W', l:all_non_errors)
endfunction

" LightlineColorscheme command

function! s:SetLightlineColorscheme(name) abort
  let g:lightline.colorscheme = a:name
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function! s:LightlineColorschemes(...) abort
  return join(map(
        \ globpath(&runtimepath, 'autoload/lightline/colorscheme/*.vim', 1, 1),
        \ "fnamemodify(v:val,':t:r')"),
        \ "\n")
endfunction

command! -nargs=1 -complete=custom,s:LightlineColorschemes LightlineColorscheme
      \ call s:SetLightlineColorscheme(<q-args>)

" Reload Lightline when configuration is reloaded
augroup LightlineReload
  autocmd!
  autocmd User ConfigurationReloaded
        \ call lightline#init() |
        \ call lightline#colorscheme() |
        \ call lightline#update()
augroup END
