let g:startify_change_to_dir       = 0
let g:startify_custom_header       = ['']
let g:startify_custom_indices      = map(range(11,99), 'string(v:val)') " Start indexes at 11 instead of 0
let g:startify_files_number        = 15
let g:startify_session_persistence = 1

nmap <Leader>ss :SSave<CR>
nmap <Leader>sl :Startify<CR>

let g:startify_list_order = [
      \   ['   Projects'],
      \   'sessions',
      \   ['   Bookmarks'],
      \   'bookmarks',
      \   ['   Commands'],
      \   'commands'
      \ ]

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ '.git/index',
      \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
      \ 'plugged/.*/doc',
      \ ]
