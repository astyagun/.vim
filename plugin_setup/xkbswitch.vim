let g:XkbSwitchEnabled = 0
let g:XkbSwitchIMappings = ['ru']

" Enable keymap
let g:XkbSwitchAssistNKeymap = 1    " for commands r and f
let g:XkbSwitchAssistSKeymap = 1    " for search lines

augroup XkbSwitchResetToUS
  autocmd!
  autocmd VimEnter,FocusGained * if mode() != 'i'
        \ | call libcall(g:XkbSwitchLib, 'Xkb_Switch_setXkbLayout', 'com.apple.keylayout.US')
        \ | endif
augroup END
