" Yanking file path into global pasteboard

" Relative path (src/foo.txt)
nnoremap <Leader>yf :let @+=expand("%")<CR>
" Relative path with line number (src/foo.txt:25)
nnoremap <Leader>yl :let @+=expand("%").":".line(".")<CR>
" Absolute path (/something/src/foo.txt)
nnoremap <Leader>yp :let @+=expand("%:p")<CR>
" Filename (foo.txt)
nnoremap <Leader>yn :let @+=expand("%:t")<CR>
" Directory name (/something/src)
nnoremap <Leader>yd :let @+=expand("%:p:h")<CR>

""""""""""""""""""
"  GitHub links  "
""""""""""""""""""

function! s:YankGitHubLink(lines) range abort
  let l:line_numbers = ""
  if a:lines
    let l:line_numbers = ":" . a:firstline . "-" . a:lastline
  endif

  let l:command = "gh browse '" . expand("%") . l:line_numbers . "' -nb $(git show master --format=%H --no-patch)"
  let l:result = systemlist(l:command)
  if !v:shell_error
    let @+=l:result[0]
    echom "Copied: " . l:result[0]
  else
    echoe "Error copying link: " . join(l:result, "\n")
  endif
endfunction

command! -range -bang YankGitHubLink <line1>,<line2>call <SID>YankGitHubLink(<bang>0)

" GitHub file link
nnoremap <Leader>yg :YankGitHubLink<CR>
" GitHub file:line link
nnoremap <Leader>yG :YankGitHubLink!<CR>
vnoremap <Leader>yG :YankGitHubLink!<CR>
