setlocal spell
setlocal nofoldenable
compiler markdown

nnoremap <buffer> <Plug> <Plug>Markdown_OpenUrlUnderCursor

" Lists

nmap <silent><script><buffer> <Space> :VimwikiToggleListItem<CR>
vmap <silent><script><buffer> <Space> :VimwikiToggleListItem<CR>
nmap <silent><script><buffer> <Leader><Space> :VimwikiToggleRejectedListItem<CR>
vmap <silent><script><buffer> <Leader><Space> :VimwikiToggleRejectedListItem<CR>
nmap <silent><script><buffer> <C-Space> :VimwikiRemoveSingleCB<CR>
vmap <silent><script><buffer> <C-Space> :VimwikiRemoveSingleCB<CR>
nmap <silent><script><buffer> <Leader><C-Space> :VimwikiRemoveCBInList<CR>
nmap <silent><script><buffer> <Leader>wl :VimwikiChangeSymbolTo -<CR>
vmap <silent><script><buffer> <Leader>wl :VimwikiChangeSymbolTo -<CR>
nmap <silent><script><buffer> <Leader>wL :VimwikiChangeSymbolInListTo -<CR>

command! -buffer -range VimwikiToggleListItem call vimwiki#lst#toggle_cb(<line1>, <line2>)
command! -buffer -range VimwikiToggleRejectedListItem
      \ call vimwiki#lst#toggle_rejected_cb(<line1>, <line2>)
command! -buffer -range VimwikiRemoveSingleCB call vimwiki#lst#remove_cb(<line1>, <line2>)
command! -buffer VimwikiRemoveCBInList call vimwiki#lst#remove_cb_in_list()
command! -buffer -range -nargs=1 VimwikiChangeSymbolTo
      \ call vimwiki#lst#change_marker(<line1>, <line2>, <f-args>, 'n')
command! -buffer -nargs=1 VimwikiChangeSymbolInListTo
      \ call vimwiki#lst#change_marker_in_list(<f-args>)
