let g:vimwiki_list = [
      \   #{
      \     auto_toc:         1,
      \     ext:              '.md',
      \     links_space_char: '_',
      \     path:             '~/Nextcloud/Notes',
      \     path_html:        '~/Nextcloud/Notes HTML',
      \     syntax:           'markdown',
      \   }
      \ ]

let g:vimwiki_auto_header = 1
let g:vimwiki_global_ext = 0
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_hl_headers = 1
let g:vimwiki_links_header = 'Сгенерированные ссылки'
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_menu = ''
let g:vimwiki_tags_header = 'Сгенерированные ссылки на тэги'
let g:vimwiki_toc_header = 'Содержание'

let g:vimwiki_key_mappings =
  \ #{
  \   global:  0,
  \   html:    0,
  \ }

function s:CustomizeVimwikiMappings() abort
  imap <buffer> <C-Q> <Plug>VimwikiDecreaseLvlSingleItem
  nnoremap <buffer> <D-CR> o<Esc>
  nnoremap <buffer> <S-CR> O<Esc>

  " Unmap header mappings to avoid conflicts with other mapping, that I have (- to :Explore)
  map <buffer> <Plug>VimwikiNoop1 <Plug>VimwikiAddHeaderLevel
  map <buffer> <Plug>VimwikiNoop2 <Plug>VimwikiRemoveHeaderLevel
endfunction

augroup Vimwiki
  autocmd!
  autocmd FileType vimwiki call s:CustomizeVimwikiMappings()
augroup END
