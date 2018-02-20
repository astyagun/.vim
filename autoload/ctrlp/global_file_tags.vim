" =============================================================================
" File:          autoload/ctrlp/global_file_tags.vim
" Description:   Search among GNU Global tags of current file
" =============================================================================

" Load guard
if ( exists('g:loaded_ctrlp_global_file_tags') && g:loaded_ctrlp_global_file_tags ) || v:version < 700 || &cp
  finish
endif
let g:loaded_ctrlp_global_file_tags = 1


" Add this extension's settings to g:ctrlp_ext_vars
"
" Required:
"
" + init: the name of the input function including the brackets and any
"         arguments
"
" + accept: the name of the action function (only the name)
"
" + lname & sname: the long and short names to use for the statusline
"
" + type: the matching type
"   - line : match full line
"   - path : match full line like a file or a directory path
"   - tabs : match until first tab character
"   - tabe : match until last tab character
"
" Optional:
"
" + enter: the name of the function to be called before starting ctrlp
"
" + exit: the name of the function to be called after closing ctrlp
"
" + opts: the name of the option handling function called when initialize
"
" + sort: disable sorting (enabled by default when omitted)
"
" + specinput: enable special inputs '..' and '@cd' (disabled by default)
"
call add(g:ctrlp_ext_vars, {
  \ 'init': 'ctrlp#global_file_tags#init()',
  \ 'accept': 'ctrlp#global_file_tags#accept',
  \ 'lname': 'long statusline name',
  \ 'sname': 'shortname',
  \ 'type': 'tabs',
  \ 'enter': 'ctrlp#global_file_tags#enter()',
  \ 'exit': 'ctrlp#global_file_tags#exit()',
  \ 'opts': 'ctrlp#global_file_tags#opts()',
  \ 'sort': 0,
  \ 'specinput': 0,
  \ })


" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#global_file_tags#init()
  " TODO: Highlight and align tags of current file
  return split(system('global -f "' . s:file_path . '" | cut -d" " -f1'), '\n')
endfunction


" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#global_file_tags#accept(mode, str)
  " TODO: Navigate to selected tag within current file
  execute 'cscope f g ' . a:str
endfunction


" (optional) Do something before enterting ctrlp
function! ctrlp#global_file_tags#enter()
endfunction


" (optional) Do something after exiting ctrlp
function! ctrlp#global_file_tags#exit()
  unlet! s:file_path
endfunction


" (optional) Set or check for user options specific to this extension
function! ctrlp#global_file_tags#opts()
endfunction


" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#global_file_tags#id()
  let s:file_path = expand('%')
  return s:id
endfunction


" vim:nofen:fdl=0:ts=2:sw=2:sts=2
