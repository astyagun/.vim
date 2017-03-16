let g:netrw_banner = 0 
let g:netrw_altv = 1              " open files on right
let g:netrw_preview = 1           " open previews vertically

map - :Vexplore<CR>
map <Leader>- :Vexplore .<CR>

" Borrowed from vim-vinegar
function! s:fnameescape(file) abort
  if exists('*fnameescape')
    return fnameescape(a:file)
  else
    return escape(a:file," \t\n*?[{`$\\%#'\"|!<")
  endif
endfunction

function! s:setup_netrw() abort
  nnoremap <buffer> <silent> cg :exe 'keepjumps cd ' .<SID>fnameescape(b:netrw_curdir)<CR>
  nnoremap <buffer> <silent> cl :exe 'keepjumps lcd '.<SID>fnameescape(b:netrw_curdir)<CR>
endfunction

augroup NetrwMappings
  autocmd!
  autocmd FileType netrw call s:setup_netrw()
augroup END
