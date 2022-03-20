setlocal spell
setlocal nofoldenable
compiler markdown

nnoremap <buffer> <Plug> <Plug>Markdown_OpenUrlUnderCursor

" Lists

nnoremap <silent><buffer> <Space> :<C-u>VimwikiToggleListItem<CR>
vnoremap <silent><buffer> <Space> :<C-u>VimwikiToggleListItem<CR>
nnoremap <silent><buffer> <Leader><Space> :<C-u>VimwikiToggleRejectedListItem<CR>
vnoremap <silent><buffer> <Leader><Space> :<C-u>VimwikiToggleRejectedListItem<CR>
nnoremap <silent><buffer> <S-Space> :<C-u>VimwikiRemoveSingleCB<CR>
vnoremap <silent><buffer> <S-Space> :<C-u>VimwikiRemoveSingleCB<CR>
nnoremap <silent><buffer> <Leader><S-Space> :<C-u>VimwikiRemoveCBInList<CR>
nnoremap <silent><buffer> <Leader>wl :<C-u>VimwikiChangeSymbolTo -<CR>
vnoremap <silent><buffer> <Leader>wl :<C-u>VimwikiChangeSymbolTo -<CR>
nnoremap <silent><buffer> <Leader>wL :<C-u>VimwikiChangeSymbolInListTo -<CR>
onoremap <silent><buffer> al :<C-u>call vimwiki#lst#TO_list_item(0, 0)<CR>
vnoremap <silent><buffer> al :<C-u>call vimwiki#lst#TO_list_item(0, 1)<CR>
onoremap <silent><buffer> il :<C-u>call vimwiki#lst#TO_list_item(1, 0)<CR>
vnoremap <silent><buffer> il :<C-u>call vimwiki#lst#TO_list_item(1, 1)<CR>

command! -buffer -range VimwikiToggleListItem call vimwiki#lst#toggle_cb(<line1>, <line2>)
command! -buffer -range VimwikiToggleRejectedListItem
      \ call vimwiki#lst#toggle_rejected_cb(<line1>, <line2>)
command! -buffer -range VimwikiRemoveSingleCB call vimwiki#lst#remove_cb(<line1>, <line2>)
command! -buffer VimwikiRemoveCBInList call vimwiki#lst#remove_cb_in_list()
command! -buffer -range -nargs=1 VimwikiChangeSymbolTo
      \ call vimwiki#lst#change_marker(<line1>, <line2>, <f-args>, 'n')
command! -buffer -nargs=1 VimwikiChangeSymbolInListTo
      \ call vimwiki#lst#change_marker_in_list(<f-args>)
