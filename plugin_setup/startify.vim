let g:startify_change_to_dir       = 0
let g:startify_custom_header       = ['']
let g:startify_files_number        = 17
let g:startify_list_order          = ['sessions', 'bookmarks', 'dir', 'commands']
let g:startify_session_persistence = 1

let g:startify_bookmarks = [
      \ '~/.rubocop.yml',
      \ ]
let g:startify_commands = [
      \ {'pi': ['Install plugins', 'PlugInstall']},
      \ {'pu': ['Update plugins', 'PlugUpdate']},
      \ {'pc': ['Clean plugins', 'PlugClean']},
      \ {'pg': ['Upgrade VimPlug', 'PlugUpgrade']},
      \ ]
let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ '.git/index',
      \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
      \ 'plugged/.*/doc',
      \ ]

nmap <Leader>ss :SSave<CR>
nmap <Leader>sl :Startify<CR>
