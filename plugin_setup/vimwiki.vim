scriptencoding utf-8

" Options {{{

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
let g:vimwiki_folding           = 'custom'
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

" }}} Options

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
  autocmd FileType vimwiki call s:VimwikiLocalCustomization()
  autocmd User StartifyBufferOpened if g:IsInVimwikiDir() | call s:VimwikiGlobalCustomization() | endif
augroup END

" function s:VimwikiGlobalCustomization {{{

function! s:VimwikiGlobalCustomization() abort
  nmap <Leader>Ww <Plug>VimwikiIndex
  nmap <Leader>Wi <Plug>VimwikiMakeDiaryNote
  nmap <Leader>WI <Plug>VimwikiDiaryIndex
  nmap <Leader>Wp :e Личное/Горизонты/1\ Проекты.md<CR>
  nmap <Leader>Wg :call <SID>VimwikiGlobalGoto()<CR>

  augroup NetrwVimwikiNewFileMapping
    autocmd!
    autocmd FileType netrw nmap <buffer> % <Leader>Wg
  augroup END
endfunction

" }}} function s:VimwikiGlobalCustomization

" function s:VimwikiLocalCustomization {{{

function! s:VimwikiLocalCustomization() abort
  " Links

  nmap <buffer> <CR> <Plug>VimwikiFollowLink
  vmap <buffer> <CR> <Plug>VimwikiNormalizeLinkVisualCR
  nmap <buffer> + <Plug>VimwikiNormalizeLink
  vmap <buffer> + <Plug>VimwikiNormalizeLinkVisual
  nmap <buffer> <Leader>Ws <Plug>VimwikiSplitLink
  nmap <buffer> <Leader>Wv <Plug>VimwikiVSplitLink
  nmap <buffer> <Leader>Wt <Plug>VimwikiTabnewLink
  nmap <buffer> <Backspace> <Plug>VimwikiGoBackLink
  nmap <buffer> <Leader>Wr <Plug>VimwikiRenameLink
  nmap <buffer> ]v <Plug>VimwikiNextLink
  nmap <buffer> [v <Plug>VimwikiPrevLink

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

  " Custom mappings

  " Convert Taskpaper item with a link into a list item with a link
  nmap <buffer> <Leader>Wa :call <SID>VimwikiConvertFromTaskPaper()<CR>
  vmap <buffer> <Leader>Wa :g/-/call <SID>VimwikiConvertFromTaskPaper() <Bar> nohl<CR>
  " Fetch IMDB rating
  nmap <buffer> <Leader>Wi :call <SID>VimwikiFetchIMDBRating()<CR>
  vmap <buffer> <Leader>Wi :g/-/call <SID>VimwikiFetchIMDBRating() <Bar> nohl<CR>

  " Commands

  command! VimwikiCopyUrl !vimwiki-copy-urls '%'

  " Folding with custom 'foldtext'

  setlocal foldenable
  setlocal foldexpr=VimwikiFoldLevel(v:lnum)
  setlocal foldmethod=expr
  setlocal foldtext=g:FoldText()

  if line("$") <= &lines
    setlocal foldlevel=2
  else
    " Fold more header levels in longer files
    setlocal foldlevel=1
  endif
endfunction

" }}} function s:VimwikiLocalCustomization

function! IsInVimwikiDir() abort
  return vimwiki#base#find_wiki(getcwd()) > -1
endfunction

" function s:VimwikiGlobalGoto {{{

function! s:VimwikiGlobalGoto() abort
  let l:current_buffer = bufnr()
  let l:prefill_path = ''
  if &filetype ==# 'netrw'
    let l:current_buffer_path = expand('%')
    if l:current_buffer_path !=# getcwd()
      let l:prefill_path = l:current_buffer_path . '/'
    endif
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
    execute 'VimwikiGoto ' . l:goto_target
  else
    execute 'silent buffer ' . l:current_buffer
  endif
endfunction

" }}} function s:VimwikiGlobalGoto

" Remove tags and trailing empty line, make first line a link text and the second line a link URL
" function s:VimwikiConvertFromTaskPaper {{{
function! s:VimwikiConvertFromTaskPaper() abort
  substitute /\v^(\s*)- (.{-})%( \@\w+\(\w+\))+\n\s*(.+)\n/\1- [\2](\3)/
  .retab
endfunction
" }}} function s:VimwikiConvertFromTaskPaper

" function s:VimwikiFetchIMDBRating {{{

function! s:VimwikiFetchIMDBRating() abort
  " Original: 0/imdb\.com<CR>yiuo<Esc>p!!xargs xh get -b <Bar> htmlq --text '[data-testid=hero-rating-bar__aggregate-rating__score]' <Bar> head -n1<CR>f/D0DkwPa <Esc>jdd

  if empty(matchstr(getline(line(".")), '\v^\s*-( \d+\.\d)* +\[.+\]\(https://(www|m)\.imdb\.com/title/tt\d+/.*\)\s*$'))
    echoe "Given line doesn't match expected format"
    return
  end

  " Normalize URL
  " m.imdb.com -> www.imdb.com
  if !empty(matchstr(getline(line(".")), '\v\(https:\/\/m\.imdb\.com\/.*\)'))
    substitute/\v\(https:\/\/m\.imdb\.com\/(.*)\)/(https:\/\/www.imdb.com\/\1)/
  endif
  " Remove query params
  if !empty(matchstr(getline(line(".")), '\v\(.*\?.+\)'))
    substitute/\v\((https:\/\/www\.imdb\.com\/title\/tt\d+\/).*\)/(\1)/
  endif

  let l:line = getline(line("."))

  " Find IMDB URL in current line
  let l:imdb_url = matchstr(l:line, '\vhttps://www\.imdb\.com/title/tt\d+')
  if empty(l:imdb_url)
    echoe "No IMDB URL found in current line"
    return
  endif

  " Fetch rating from IMDB
  let l:request_user_agent = "User-Agent:Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15"
  let l:imdb_fetch_result = systemlist($"xh get {l:imdb_url} '{l:request_user_agent}' -b | htmlq --text '[data-testid=hero-rating-bar__aggregate-rating__score]' | head -n1")
  if empty(l:imdb_fetch_result)
    echoe "Error fetching rating from IMDB"
    return
  endif
  let l:imdb_rating = substitute(l:imdb_fetch_result[0], "/10$", "", "")

  if match(l:imdb_rating, '\zs\d\.\d\ze') < 0
    echoe "Error: " . l:imdb_rating
    return
  endif

  " Add rating to current line
  let l:new_line = substitute(l:line, '\v^(\s*(- )?)(.*)$', $'\1{l:imdb_rating} \3', "")
  call setline(line("."), l:new_line)
endfunction

" }}} function s:VimwikiFetchIMDBRating
