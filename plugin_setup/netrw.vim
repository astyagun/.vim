" Many things are borrowed from https://github.com/tpope/vim-vinegar/blob/master/plugin/vinegar.vim
let g:netrw_altv = 1              " open files on right
let g:netrw_banner = 0
let g:netrw_list_hide = '.*\.swp$'
let g:netrw_nobeval = 1
let g:netrw_preview = 1           " open previews vertically

map - :Explore<CR>
map <Leader>- :Explore .<CR>

" Borrowed from vim-vinegar
function! s:fnameescape(file) abort
  if exists('*fnameescape')
    return fnameescape(a:file)
  else
    return escape(a:file," \t\n*?[{`$\\%#'\"|!<")
  endif
endfunction

function! s:escaped(first, last) abort
  let files = getline(a:first, a:last)
  call filter(files, 'v:val !~# "^\" "')
  call map(files, 'substitute(v:val, "[/*|@=]\\=\\%(\\t.*\\)\\=$", "", "")')
  return join(map(files, 'fnamemodify(b:netrw_curdir."/".v:val,":~:.")'), ' ')
endfunction

function! s:setup_netrw() abort
  nnoremap <buffer> <silent> cg :exe 'keepjumps cd ' .<SID>fnameescape(b:netrw_curdir)<CR>
  nnoremap <buffer> <silent> cl :exe 'keepjumps lcd '.<SID>fnameescape(b:netrw_curdir)<CR>
  nnoremap <buffer> . :<C-U> <C-R>=<SID>escaped(line('.'), line('.') - 1 + v:count1)<CR><Home>
  xnoremap <buffer> . <Esc>: <C-R>=<SID>escaped(line("'<"), line("'>"))<CR><Home>
  nmap <buffer> ! .!
  xmap <buffer> ! .!
endfunction

augroup NetrwMappings
  autocmd!
  autocmd FileType netrw call s:setup_netrw()
augroup END
