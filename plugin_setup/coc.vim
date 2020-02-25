let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-markdownlint',
      \ 'coc-solargraph',
      \ 'coc-vimlsp',
      \ ]

nmap <silent> gr <Plug>(coc-references)

function! s:gotoDefinition() abort
  let l:current_tag = expand('<cWORD>')

  let l:current_position    = getcurpos()
  let l:current_position[0] = bufnr()

  let l:current_tag_stack = gettagstack()
  let l:current_tag_index = l:current_tag_stack['curidx']
  let l:current_tag_items = l:current_tag_stack['items']

  if CocAction('jumpDefinition')
    let l:new_tag_index = l:current_tag_index + 1
    let l:new_tag_item = [#{tagname: l:current_tag, from: l:current_position}]
    let l:new_tag_items = l:current_tag_items[:]
    if l:current_tag_index <= len(l:current_tag_items)
      call remove(l:new_tag_items, l:current_tag_index - 1, -1)
    endif
    let l:new_tag_items += l:new_tag_item

    call settagstack(winnr(), #{curidx: l:new_tag_index, items: l:new_tag_items}, 'r')
  endif
endfunction

augroup Coc
  autocmd!
  autocmd FileType ruby nnoremap <buffer><silent> <C-]> :call <SID>gotoDefinition()<CR>
  autocmd FileType ruby nnoremap <buffer><silent> K :call CocAction('doHover')<CR>
  autocmd FileType ruby,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
