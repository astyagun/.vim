let g:XkbSwitchEnabled = 1
let g:XkbSwitchIMappings = ['ru']
let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'

" Enable keymap
let g:XkbSwitchAssistNKeymap = 1    " for commands r and f
let g:XkbSwitchAssistSKeymap = 1    " for search lines

function! s:XkbSwitchToILayoutOfAlternateBuffer() abort
  let l:ilayout_of_alternate_buffer = getbufvar(bufname(winbufnr(winnr('#'))), 'xkb_ilayout')
  if len(l:ilayout_of_alternate_buffer) > 0
    call libcall(
          \   g:XkbSwitchLib,
          \   'Xkb_Switch_setXkbLayout',
          \   l:ilayout_of_alternate_buffer
          \ )
  endif
endfunction

augroup XkbSwitchCustomizations
  autocmd!
  " Reset to US layout
  autocmd VimEnter,FocusGained * if mode() != 'i'
        \ | call libcall(g:XkbSwitchLib, 'Xkb_Switch_setXkbLayout', 'com.apple.keylayout.US')
        \ | endif
  " Treat terminal mode as INSERT mode
  autocmd TerminalWinOpen * call s:XkbSwitchToILayoutOfAlternateBuffer()
augroup END
