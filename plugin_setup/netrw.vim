" Many things are borrowed from https://github.com/tpope/vim-vinegar/blob/master/plugin/vinegar.vim
let g:netrw_altv      = 1 " open files on right
let g:netrw_banner    = 0
let g:netrw_home      = '~/.vim/history'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_nobeval   = 1
let g:netrw_winsize   = -g:sidebar_width

" Global mappings {{{

map - :call <SID>ExploreAndSelectCurrentFile()<CR>
map _ :call <SID>ExploreAndSelectCurrentFile(v:false)<CR>
map <Leader>- :Explore .<CR>
map <Leader>_ :50Vexplore .<CR>

function! s:ExploreAndSelectCurrentFile(horizontal = v:true) abort
  let l:current_file_name = expand('%:t')

  if a:horizontal
    Explore
  else
    50Vexplore
  endif

  call search('\V\^' . l:current_file_name . '\$', 'c')
endfunction

" }}} Global mappings

" Buffer local mappings {{{

augroup NetrwMappings
  autocmd!
  autocmd FileType netrw call s:SetupNetrw() | setlocal signcolumn=no
augroup END

function! s:SetupNetrw() abort
  nnoremap <buffer> . :<C-U> <C-r>=<SID>Escaped(line('.'), line('.') - 1 + v:count1)<CR><Home>
  xnoremap <buffer> . <Esc>: <C-r>=<SID>Escaped(line("'<"), line("'>"))<CR><Home>
  nmap <buffer> ! .!
  xmap <buffer> ! .!

  nmap <buffer> <C-l> <Nop>
  nunmap <buffer> <C-l>
endfunction

function! s:Escaped(first, last) abort
  let files = getline(a:first, a:last)
  call filter(files, 'v:val !~# "^\" "')
  call map(files, 'substitute(v:val, "[/*|@=]\\=\\%(\\t.*\\)\\=$", "", "")')
  return join(map(files, 'fnamemodify(b:netrw_curdir."/".v:val,":~:.")'), ' ')
endfunction

" }}} Buffer local mappings
