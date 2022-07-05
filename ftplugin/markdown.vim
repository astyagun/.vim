setlocal spell
setlocal nofoldenable
compiler markdown

nnoremap <buffer> <Plug> <Plug>Markdown_OpenUrlUnderCursor

" Lists

nnoremap <silent><script><buffer> <Space> :CustomVimwikiToggleListItem<CR>
vnoremap <silent><script><buffer> <Space> :CustomVimwikiToggleListItem<CR>
nnoremap <silent><script><buffer> <Leader><Space> :CustomVimwikiToggleRejectedListItem<CR>
vnoremap <silent><script><buffer> <Leader><Space> :CustomVimwikiToggleRejectedListItem<CR>
nnoremap <silent><script><buffer> <S-Space> :CustomVimwikiRemoveSingleCB<CR>
vnoremap <silent><script><buffer> <S-Space> :CustomVimwikiRemoveSingleCB<CR>
nnoremap <silent><script><buffer> <Leader><S-Space> :CustomVimwikiRemoveCBInList<CR>
nnoremap <silent><script><buffer> <Leader>Wl :CustomVimwikiChangeSymbolTo -<CR>
vnoremap <silent><script><buffer> <Leader>Wl :CustomVimwikiChangeSymbolTo -<CR>
nnoremap <silent><script><buffer> <Leader>WL :CustomVimwikiChangeSymbolInListTo -<CR>
onoremap <silent><script><buffer> al :call vimwiki#lst#TO_list_item(0, 0)<CR>
vnoremap <silent><script><buffer> al :call vimwiki#lst#TO_list_item(0, 1)<CR>
onoremap <silent><script><buffer> il :call vimwiki#lst#TO_list_item(1, 0)<CR>
vnoremap <silent><script><buffer> il :call vimwiki#lst#TO_list_item(1, 1)<CR>

command! -buffer -range CustomVimwikiToggleListItem call vimwiki#lst#toggle_cb(<line1>, <line2>)
command! -buffer -range CustomVimwikiToggleRejectedListItem
      \ call vimwiki#lst#toggle_rejected_cb(<line1>, <line2>)
command! -buffer -range CustomVimwikiRemoveSingleCB call vimwiki#lst#remove_cb(<line1>, <line2>)
command! -buffer CustomVimwikiRemoveCBInList call vimwiki#lst#remove_cb_in_list()
command! -buffer -range -nargs=1 CustomVimwikiChangeSymbolTo
      \ call vimwiki#lst#change_marker(<line1>, <line2>, <f-args>, 'n')
command! -buffer -nargs=1 CustomVimwikiChangeSymbolInListTo
      \ call vimwiki#lst#change_marker_in_list(<f-args>)
