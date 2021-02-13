let g:startify_change_to_dir       = 0
let g:startify_custom_header       = ['']
let g:startify_custom_indices      = map(range(11,99), 'string(v:val)') " Start indexes at 11 instead of 0
let g:startify_files_number        = 15
let g:startify_padding_left        = 45
let g:startify_session_persistence = 1

nmap <Leader>ss :SSave<CR>
nmap <Leader>sl :Startify<CR>

let g:startify_list_order = [
      \   ['                                                        Projects'],
      \   'sessions',
      \   ['                                                        Bookmarks'],
      \   'bookmarks',
      \   ['                                                        Commands'],
      \   'commands'
      \ ]

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ '.git/index',
      \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
      \ 'plugged/.*/doc',
      \ ]


" Per-project 'textwidth' and 'colorcolumn' based on Rubocop LineLength {{{

autocmd User StartifyBufferOpened call <SID>SetProjectTextwidth()

function! s:SetProjectTextwidth() abort
  let l:rubocop_line_length = s:RubocopLineLength()
  if l:rubocop_line_length
    let &textwidth = l:rubocop_line_length
    let &colorcolumn = l:rubocop_line_length + 1
  endif
endfunction

function! s:RubocopLineLength() abort
  if !filereadable(".rubocop.yml")
    return v:false
  endif

  let l:result = system('rg --multiline "(?s)Layout/LineLength:.+?^\S" .rubocop.yml | rg Max | cut -d: -f2')
  if v:shell_error || empty(l:result)
    return v:false
  endif

  return str2nr(l:result)
endfunction

" }}} Per-project `textwidth` based on Rubocop LineLength
