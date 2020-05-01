let g:XkbSwitchEnabled   = 1
let g:XkbSwitchIMappings = ['ru']
let g:XkbSwitchLib       = '/usr/local/lib/libInputSourceSwitcher.dylib'

" Enable keymap
let g:XkbSwitchAssistNKeymap = 1    " for commands r and f
let g:XkbSwitchAssistSKeymap = 1    " for search lines
let g:XkbSwitchKeymapNames   = {'org.sil.ukelele.keyboardlayout.russianmodified.russianmodified': 'ru'}
set keymap=russian-jcukenmac

set iminsert=0
set imsearch=0

let s:xkb_default_layout = 'org.sil.ukelele.keyboardlayout..keylayout.USmodified'

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

function! s:XkbSwitchToDefaultLayout() abort
  call libcall(
        \   g:XkbSwitchLib,
        \   'Xkb_Switch_setXkbLayout',
        \   s:xkb_default_layout
        \ )
endfunction

augroup XkbSwitchCustomizations
  autocmd!
  " Reset to US layout
  autocmd VimEnter,FocusGained * if mode() != 'i'
        \ | call libcall(g:XkbSwitchLib, 'Xkb_Switch_setXkbLayout', s:xkb_default_layout)
        \ | endif
  " Treat terminal mode as INSERT mode
  autocmd TerminalWinOpen * call s:XkbSwitchToILayoutOfAlternateBuffer()
  autocmd WinLeave * if &buftype ==# 'terminal' | call s:XkbSwitchToDefaultLayout() | endif
augroup END
