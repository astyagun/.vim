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
  \   headers: 0,
  \   html:    0,
  \ }

function s:CustomizeVimwikiMappings() abort
  imap <buffer> <C-Q> <Plug>VimwikiDecreaseLvlSingleItem
  " TODO: bring back <D-CR> and <S-CR> for newline creation from normal mode
  " |vimwiki_<D-CR>| |vimwiki_<S-CR>|
endfunction

augroup Vimwiki
  autocmd!
  autocmd FileType vimwiki call s:CustomizeVimwikiMappings()
augroup END
