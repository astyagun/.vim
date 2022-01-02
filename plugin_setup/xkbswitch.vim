let g:MyXkbSwitchNLayout = "org.sil.ukelele.keyboardlayout.usmodified.u.s.modified"

let g:XkbSwitchEnabled   = 1
let g:XkbSwitchIMappings = ["ru"]
let g:XkbSwitchLib       = "/usr/local/lib/libInputSourceSwitcher.dylib"
let g:XkbSwitchNLayout   = g:MyXkbSwitchNLayout

" Enable keymap
let g:XkbSwitchAssistNKeymap = 1    " for commands r and f
let g:XkbSwitchAssistSKeymap = 1    " for search lines
let g:XkbSwitchKeymapNames   = {"org.sil.ukelele.keyboardlayout.russianmodified.russianmodified": "ru"}
set keymap=russian-jcukenmac

set iminsert=0
set imsearch=0

augroup XkbSwitchCustomizations
  autocmd!

  autocmd VimEnter,FocusGained * if mode() ==# "i" || &buftype ==# "terminal"
        \|    call s:XkbSwitchToCurrentILayout()
        \|  else
        \|    call s:XkbSwitchToDefaultNLayout()
        \|  endif

  " Vimwiki notes directory

  autocmd User StartifyBufferOpened if IsInVimwikiDir() | let g:XkbSwitchILayout = "ru" | endif

  " Fzf in Vimwiki notes directory

  " When opening Fzf terminal window:
  " - Switch to ILayout
  " - Prevent a switch back to NLayout by a BufEnter hook from XkbSwitch
  autocmd User BeforeFzfOpen call s:XkbSwitchToILayoutOfAlternateBuffer() | let g:XkbSwitchNLayout = ""
  autocmd TerminalWinOpen * let g:XkbSwitchNLayout = g:MyXkbSwitchNLayout

  " When leaving a terminal window:
  " - Switch back to default NLayout
  autocmd WinLeave * if &buftype ==# "terminal" | call s:XkbSwitchToDefaultNLayout() | endif
augroup END

" function s:XkbSwitchToILayoutOfAlternateBuffer {{{

function! s:XkbSwitchToILayoutOfAlternateBuffer() abort
  let l:ilayout_of_alternate_buffer = getbufvar(
        \   bufname(winbufnr(winnr("#"))),
        \   "xkb_ilayout",
        \   get(g:, "XkbSwitchILayout", v:null)
        \ )
  if !empty(l:ilayout_of_alternate_buffer)
    call libcall(
          \   g:XkbSwitchLib,
          \   g:XkbSwitch["set"],
          \   l:ilayout_of_alternate_buffer
          \ )
  endif
endfunction

" }}} s:XkbSwitchToILayoutOfAlternateBuffer
" function s:XkbSwitchToDefaultNLayout {{{

function! s:XkbSwitchToDefaultNLayout() abort
  call libcall(
        \   g:XkbSwitchLib,
        \   g:XkbSwitch["set"],
        \   g:XkbSwitchNLayout
        \ )
endfunction

" }}} s:XkbSwitchToDefaultNLayout
" function s:XkbSwitchToCurrentILayout {{{

function! s:XkbSwitchToCurrentILayout() abort
  if !empty(g:XkbSwitchILayout)
    call libcall(
          \   g:XkbSwitchLib,
          \   g:XkbSwitch["set"],
          \   get(b:, "xkb_ilayout", g:XkbSwitchILayout)
          \ )
  endif
endfunction

" }}} s:XkbSwitchToCurrentILayout
