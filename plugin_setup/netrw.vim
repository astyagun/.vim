" Many things are borrowed from https://github.com/tpope/vim-vinegar/blob/master/plugin/vinegar.vim
let g:netrw_altv      = 1 " open files on right
let g:netrw_banner    = 0
let g:netrw_home      = '~/.vim/history'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_nobeval   = 1
let g:netrw_preview   = 1 " open previews vertically
let g:netrw_winsize   = -g:sidebar_width

map - :Explore<CR>
map <Leader>- :Explore .<CR>
map _ :Vexplore<CR>
map <Leader>_ :Vexplore .<CR>

augroup NetrwMappings
  autocmd!
  autocmd FileType netrw call s:SetupNetrw()
augroup END

function! s:SetupNetrw() abort
  nnoremap <buffer><silent> cg :execute 'keepjumps cd ' .<SID>FNameEscape(b:netrw_curdir)<CR>
  nnoremap <buffer><silent> cl :execute 'keepjumps lcd '.<SID>FNameEscape(b:netrw_curdir)<CR>
  nnoremap <buffer> . :<C-U> <C-r>=<SID>Escaped(line('.'), line('.') - 1 + v:count1)<CR><Home>
  xnoremap <buffer> . <Esc>: <C-r>=<SID>Escaped(line("'<"), line("'>"))<CR><Home>
  nmap <buffer> ! .!
  xmap <buffer> ! .!

  nmap <buffer> <C-l> <Nop>
  nunmap <buffer> <C-l>
endfunction

" Borrowed from vim-vinegar
function! s:FNameEscape(file) abort
  if exists('*fnameescape')
    return fnameescape(a:file)
  else
    return escape(a:file," \t\n*?[{`$\\%#'\"|!<")
  endif
endfunction

function! s:Escaped(first, last) abort
  let files = getline(a:first, a:last)
  call filter(files, 'v:val !~# "^\" "')
  call map(files, 'substitute(v:val, "[/*|@=]\\=\\%(\\t.*\\)\\=$", "", "")')
  return join(map(files, 'fnamemodify(b:netrw_curdir."/".v:val,":~:.")'), ' ')
endfunction
