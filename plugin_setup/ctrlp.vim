let g:ctrlp_map = ''
let g:ctrlp_match_window = 'bottom,order:ttb,min:10,max:10,results:25'
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_show_hidden = 1

" Prevent running in home directory
function! s:RunCtrlP(directory, command_name)
  if a:directory == $HOME
    echo "Won't run CtrlP in home directory!"
    return
  endif
  execute a:command_name
endfunction

map <D-p> :call <SID>RunCtrlP(getcwd(), 'CtrlP')<CR>
map <D-P> :call <SID>RunCtrlP(expand('%:p:h'), 'CtrlPCurFile')<CR>
map <D-T> :call <SID>RunCtrlP(expand('%:p:h'), 'CtrlPTag')<CR>
imap <D-p> <Esc><D-p>
imap <D-P> <Esc><D-p>
imap <D-T> <Esc><D-T>
map <Leader>lb :CtrlPBuffer<CR>
map <Leader>lr :CtrlPMRUFiles<CR>

" Exchange <C-(n|p)> mappings with <C-(j|k)> mappings
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<bs>', '<c-h>'],
  \ 'PrtDelete()':          ['<del>', '<C-l>'],
  \ 'PrtDeleteWord()':      ['<c-w>'],
  \ 'PrtClear()':           ['<c-u>'],
  \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
  \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
  \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
  \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
  \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
  \ 'PrtHistory(-1)':       ['<c-j>'],
  \ 'PrtHistory(1)':        ['<c-k>'],
  \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
  \ 'AcceptSelection("t")': ['<c-t>'],
  \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
  \ 'ToggleFocus()':        ['<s-tab>'],
  \ 'ToggleRegex()':        ['<c-r>'],
  \ 'ToggleByFname()':      ['<c-d>'],
  \ 'ToggleType(1)':        ['<c-up>'],
  \ 'ToggleType(-1)':       ['<c-down>'],
  \ 'PrtExpandDir()':       ['<tab>'],
  \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
  \ 'PrtInsert()':          ['<c-\>'],
  \ 'PrtCurStart()':        ['<c-a>'],
  \ 'PrtCurEnd()':          ['<c-e>'],
  \ 'PrtCurLeft()':         ['<left>', '<c-b>'],
  \ 'PrtCurRight()':        ['<right>', '<c-f>'],
  \ 'PrtClearCache()':      ['<F5>'],
  \ 'PrtDeleteEnt()':       ['<F7>'],
  \ 'CreateNewFile()':      ['<c-y>'],
  \ 'MarkToOpen()':         ['<c-z>'],
  \ 'OpenMulti()':          ['<c-o>'],
  \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
  \ }

let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

" Use ripgrep in CtrlP for listing files
if executable('rg')
  let g:ctrlp_user_command = 'rg' .
        \ ' --hidden' .
        \ ' --no-ignore-vcs' .
        \ ' --ignore-file ~/.vim/plugin_setup/ctrlp.ignore' .
        \ ' --files' .
        \ ' --color=never %s' .
        \ ' --ignore-case'

  " ripgrep is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

