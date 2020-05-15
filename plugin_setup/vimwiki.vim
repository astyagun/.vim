scriptencoding utf-8

let g:vimwiki_list = [
      \   #{
      \     auto_toc:               1,
      \     diary_auto_diary_index: 1,
      \     diary_caption_level:    2,
      \     diary_header:           'Входящие',
      \     diary_index:            'Содержание',
      \     diary_rel_path:         '1 Входящие',
      \     ext:                    '.md',
      \     index:                  'Содержание',
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
  \   global:  0,
  \   headers: 0,
  \   html:    0,
  \   links:   0,
  \   lists:   0,
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
  nmap <Leader>wp :e Личное/Горизонты/1\ Проекты.md<CR>
  nmap <Leader>wg :call <SID>VimwikiGlobalGoto()<CR>
endfunction

function! s:CustomizeVimwikiBufferMappings() abort
  " Links

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

  " Headers

  nmap <buffer> ]u <Plug>VimwikiGoToParentHeader
  nmap <buffer> [u <Plug>VimwikiGoToParentHeader
  nmap <buffer> ]] <Plug>VimwikiGoToNextHeader
  nmap <buffer> [[ <Plug>VimwikiGoToPrevHeader
  nmap <buffer> ]= <Plug>VimwikiGoToNextSiblingHeader
  nmap <buffer> [= <Plug>VimwikiGoToPrevSiblingHeader
  omap <buffer> aH <Plug>VimwikiTextObjHeaderSub
  vmap <buffer> aH <Plug>VimwikiTextObjHeaderSubV
  omap <buffer> iH <Plug>VimwikiTextObjHeaderSubContent
  vmap <buffer> iH <Plug>VimwikiTextObjHeaderSubContentV

  " Lists

  nmap <buffer> <C-Space> <Plug>VimwikiToggleListItem
  vmap <buffer> <C-Space> <Plug>VimwikiToggleListItem
endfunction

function! IsInVimwikiDir() abort
  return vimwiki#base#find_wiki(getcwd()) > -1
endfunction

function! s:VimwikiGlobalGoto() abort
  let l:current_buffer = bufnr()
  let l:prefill_path = ''
  if &filetype ==# 'netrw'
    let l:prefill_path = expand('%') . '/'
  endif

  " - Current file being a vimwiki file is a prerequisite for completion to work currently
  " - Root index file being opened is required for completion to complete from the wiki root, which is required by
  "   VimwikiGoto
  silent VimwikiIndex

  let l:old_imsearch = &imsearch
  setlocal imsearch=1

  let l:goto_target = input('Go to: ', l:prefill_path, 'customlist,vimwiki#base#complete_links_escaped')

  let &l:imsearch = l:old_imsearch

  if !empty(l:goto_target)
    let l:goto_target = substitute(l:goto_target, '\(\\\)\@<! ', '\\ ', 'g') " Escape unescaped spaces
    execute 'VimwikiGoto ' . l:goto_target
  else
    execute 'silent buffer ' . l:current_buffer
  endif
endfunction
