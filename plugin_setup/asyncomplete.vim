let g:asyncomplete_auto_popup = 0

inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

augroup AsyncompleteSetup
  autocmd!
  autocmd User asyncomplete_setup,ConfigurationReloaded call s:AsyncompleteSetup()
augroup END

function! s:AsyncompleteSetup()
  call asyncomplete#unregister_source('ultisnips')
  call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))

  call asyncomplete#unregister_source('tags')
  call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
        \ 'name': 'tags',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#tags#completor'),
        \ 'config': {
        \    'max_file_size': 100000000,
        \  },
        \ }))

  call asyncomplete#unregister_source('omni')
  call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
        \ 'name': 'omni',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#omni#completor')
        \  }))
endfunction
