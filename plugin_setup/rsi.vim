" Readline deletions {{{

" Create new change to be able to undo deletions
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-k> <C-g>u<C-o>D
cnoremap <C-k> <C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>
noremap! <D-k> <C-k>

" }}} Readline deletions

" Change word case in NORMAL and INSERT modes {{{

" <A-c> - capitalize
nnoremap <M-c> ebguiw~he
imap <M-c> <Esc><M-c>a
" <A-l> - lowercase
nnoremap <M-l> ebwguiwe
imap <M-l> <Esc><M-l>a
" <A-S-l> - uppercase
nnoremap <M-u> ebwgUiwe
imap <M-u> <Esc><M-u>a

" }}} Change word case in NORMAL and INSERT modes

" Add meta mappings {{{

" NOTE: Depends on 'nomacmeta'
" NOTE: Depends on dead key state being removed from <M-n> key using Ukelele

let s:meta_keys_to_map = {
      \ 'b': ['∫', '←'],
      \ 'c': ['ç', '≠'],
      \ 'd': ['∂', 'ћ'],
      \ 'f': ['ƒ', '÷'],
      \ 'l': ['¬', '∆'],
      \ 'n': ['˜', '™'],
      \ 'p': ['π', '‘'],
      \ 'u': ['¨', 'ѓ'],
      \ }

function! s:SendTerminalMetaCombination(key) abort
  call term_sendkeys(bufnr('%'), "\<Esc>" . a:key)
endfunction

function! s:SetMetaKeyMappings() abort
  for source_key in keys(s:meta_keys_to_map)
    for target_key in s:meta_keys_to_map[source_key]
      " Use {rhs} of existing <M-*> mappings to react to actual characters produced by Option-* keypresses
      let l:source_meta_mapping = '<M-' . source_key . '>'

      for target_mode in ['n', 'i', 'c']
        let l:source_meta_mapping_argumets = maparg(l:source_meta_mapping, target_mode, v:false, v:true)

        if !empty(l:source_meta_mapping_argumets)
          let l:noremap = l:source_meta_mapping_argumets.noremap ? 'nore' : ''
          execute target_mode . l:noremap . 'map ' . target_key . ' ' . l:source_meta_mapping_argumets.rhs
        endif
      endfor

      " Pass Meta key combinations to :terminal
      execute 'tnoremap <silent> '
            \. target_key . ' '
            \. &termwinkey . ':call <SID>SendTerminalMetaCombination("' . source_key . '")<CR>'
    endfor
  endfor
endfunction

augroup SetMetaKeyMappings
  autocmd!
  autocmd VimEnter * call s:SetMetaKeyMappings()
  autocmd User ConfigurationReloaded call s:SetMetaKeyMappings()
augroup end

" }}} Add meta mappings
