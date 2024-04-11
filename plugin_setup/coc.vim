let g:coc_global_extensions = [
      \ '@yaegassy/coc-ansible',
      \ 'coc-css',
      \ 'coc-docker',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-markdownlint',
      \ 'coc-sh',
      \ 'coc-solargraph',
      \ 'coc-ultisnips',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \ ]

let g:coc_filetype_map = {
      \ 'yaml.ansible': 'ansible'
      \ }

inoremap <silent><expr> <C-x><C-d> coc#refresh()
map <Leader>cf :CocCommand editor.action.formatDocument<CR><Esc>
map <Leader>cr :CocRestart<CR><Esc>

augroup Coc
  autocmd!

  autocmd FileType ruby nnoremap <buffer><silent> <C-]> :call <SID>GotoDefinition()<CR>
  autocmd FileType ruby nnoremap <buffer><silent> <C-w><C-]> :wincmd s <Bar> call <SID>GotoDefinition()<CR>
  autocmd FileType vim setlocal tagfunc=CocTagFunc

  autocmd FileType ruby nnoremap <buffer><silent> <D-g> :CocFzfList outline<CR>
  autocmd FileType ruby nnoremap <buffer><silent> K :call CocAction('doHover')<CR>

  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

function! s:GotoDefinition() abort
  let l:current_tag = expand('<cWORD>')

  let l:current_position    = getcurpos()
  let l:current_position[0] = bufnr()

  let l:current_tag_stack = gettagstack()
  let l:current_tag_index = l:current_tag_stack['curidx']
  let l:current_tag_items = l:current_tag_stack['items']

  if CocAction('jumpDefinition')
    let l:new_tag_index = l:current_tag_index + 1
    let l:new_tag_item  = [#{tagname: l:current_tag, from: l:current_position}]
    let l:new_tag_items = l:current_tag_items[:]
    if l:current_tag_index <= len(l:current_tag_items)
      call remove(l:new_tag_items, l:current_tag_index - 1, -1)
    endif
    let l:new_tag_items += l:new_tag_item

    call settagstack(winnr(), #{curidx: l:new_tag_index, items: l:new_tag_items}, 'r')
  endif
endfunction
