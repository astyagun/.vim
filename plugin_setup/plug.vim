" gx to open GitHub URLs on browser
function! s:plug_gx()
  if getline('.') =~ '^ *Plug\s'
    let cfile = expand('<cfile>')
    if !filereadable(cfile) && cfile != 'Plug'
      call netrw#BrowseX(expand((exists('g:netrw_gx') ? g:netrw_gx : 'https://github.com/' . cfile)),
            \ netrw#CheckIfRemote())
    endif
  else
    call netrw#BrowseX(expand((exists('g:netrw_gx') ? g:netrw_gx : '<cfile>')), netrw#CheckIfRemote())
  endif
endfunction

augroup PlugGx
  autocmd!
  autocmd BufRead plug.vim nnoremap <buffer> <silent> gx :call <SID>plug_gx()<cr>
augroup END
