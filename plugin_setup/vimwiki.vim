let g:vimwiki_list = [
      \   #{
      \     auto_toc:               1,
      \     diary_auto_diary_index: 1,
      \     diary_caption_level:    2,
      \     diary_header:           'Входящие',
      \     diary_index:            'Содержание',
      \     diary_rel_path:         '1_Входящие',
      \     ext:                    '.md',
      \     index:                  'Содержание',
      \     links_space_char:       '_',
      \     path:                   '~/Nextcloud/Заметки',
      \     path_html:              '~/Nextcloud/Заметки HTML',
      \     syntax:                 'markdown',
      \   }
      \ ]

let g:vimwiki_auto_header       = 1
let g:vimwiki_dir_link          = 'Содержание'
let g:vimwiki_folding           = 'expr'
let g:vimwiki_global_ext        = 0
let g:vimwiki_hl_cb_checked     = 1
let g:vimwiki_hl_headers        = 1
let g:vimwiki_links_header      = 'Сгенерированные ссылки'
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_menu              = ''
let g:vimwiki_tags_header       = 'Сгенерированные ссылки на тэги'
let g:vimwiki_toc_header        = 'Содержание'

let g:vimwiki_diary_months = {
      \ 1:  'Январь',  2:  'Февраль', 3:  'Март',
      \ 4:  'Апрель',  5:  'Май',     6:  'Июнь',
      \ 7:  'Июль',    8:  'Август',  9:  'Сентябрь',
      \ 10: 'Октябрь', 11: 'Ноябрь',  12: 'Декабрь'
      \ }

let g:vimwiki_key_mappings =
  \ #{
  \   global: 0,
  \   html:   0,
  \   links:  0,
  \ }

augroup Vimwiki
  autocmd!
  autocmd FileType vimwiki call s:CustomizeVimwikiBufferMappings()
  autocmd User StartifyBufferOpened if g:IsInVimwikiDir() | call s:CustomizeVimwikiMappings() | endif
augroup END

function! s:CustomizeVimwikiMappings() abort
  nmap <Leader>ww <Plug>VimwikiIndex
  nmap <Leader>wt <Plug>VimwikiTabIndex
  nmap <Leader>wi <Plug>VimwikiMakeDiaryNote
  nmap <Leader>wI <Plug>VimwikiDiaryIndex
endfunction

function! s:CustomizeVimwikiBufferMappings() abort
  nmap <buffer> <CR> <Plug>VimwikiFollowLink
  vmap <buffer> <CR> <Plug>VimwikiNormalizeLinkVisualCR
  nmap <buffer> + <Plug>VimwikiNormalizeLink
  vmap <buffer> + <Plug>VimwikiNormalizeLinkVisual
  nmap <buffer> <Leader>ws <Plug>VimwikiSplitLink
  nmap <buffer> <Leader>wv <Plug>VimwikiVSplitLink
  nmap <buffer> <Backspace> <Plug>VimwikiGoBackLink

  nmap <buffer> <Tab> <Plug>VimwikiNextLink
  nmap <buffer> <S-Tab> <Plug>VimwikiPrevLink

  nmap <buffer> <Leader>wn <Plug>VimwikiGoto
  nmap <buffer> <Leader>wr <Plug>VimwikiRenameLink

  " Unmap header mappings to avoid conflicts with other mapping, that I have (- to :Explore)
  map <buffer> <Plug> <Plug>VimwikiAddHeaderLevel
  map <buffer> <Plug> <Plug>VimwikiRemoveHeaderLevel
endfunction

function! IsInVimwikiDir() abort
  return vimwiki#base#find_wiki(getcwd()) > -1
endfunction
