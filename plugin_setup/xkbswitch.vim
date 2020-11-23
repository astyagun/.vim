let g:XkbSwitchEnabled   = 1
let g:XkbSwitchIMappings = ['ru']
let g:XkbSwitchLib       = '/usr/local/lib/libInputSourceSwitcher.dylib'
let g:XkbSwitchNLayout   = 'org.sil.ukelele.keyboardlayout..keylayout.USmodified'

" Enable keymap
let g:XkbSwitchAssistNKeymap = 1    " for commands r and f
let g:XkbSwitchAssistSKeymap = 1    " for search lines
let g:XkbSwitchKeymapNames   = {'org.sil.ukelele.keyboardlayout.russianmodified.russianmodified': 'ru'}
set keymap=russian-jcukenmac

set iminsert=0
set imsearch=0

augroup XkbSwitchCustomizations
  autocmd!
  autocmd VimEnter,FocusGained * if mode() ==# "i" || &buftype ==# "terminal"
        \|    call s:XkbSwitchToDefaultILayout()
        \|  else
        \|    call s:XkbSwitchToDefaultNLayout()
        \|  endif
  autocmd TerminalWinOpen * call s:XkbSwitchToILayoutOfAlternateBuffer()
  autocmd WinLeave * if &buftype ==# 'terminal' | call s:XkbSwitchToDefaultNLayout() | endif
  autocmd User StartifyBufferOpened if IsInVimwikiDir() | let g:XkbSwitchILayout = 'ru' | endif
augroup END

function! s:XkbSwitchToILayoutOfAlternateBuffer() abort
  let l:ilayout_of_alternate_buffer = getbufvar(
        \   bufname(winbufnr(winnr('#'))),
        \   'xkb_ilayout',
        \   get(g:, 'XkbSwitchILayout', v:null)
        \ )
  if !empty(l:ilayout_of_alternate_buffer)
    call libcall(
          \   g:XkbSwitchLib,
          \   'Xkb_Switch_setXkbLayout',
          \   l:ilayout_of_alternate_buffer
          \ )
  endif
endfunction

function! s:XkbSwitchToDefaultNLayout() abort
  call libcall(
        \   g:XkbSwitchLib,
        \   'Xkb_Switch_setXkbLayout',
        \   g:XkbSwitchNLayout
        \ )
endfunction

function! s:XkbSwitchToDefaultILayout() abort
  if !empty(g:XkbSwitchILayout)
    call libcall(
          \   g:XkbSwitchLib,
          \   'Xkb_Switch_setXkbLayout',
          \   g:XkbSwitchILayout
          \ )
  endif
endfunction
