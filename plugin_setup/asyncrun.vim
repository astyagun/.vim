" https://github.com/skywind3000/asyncrun.vim/wiki/Cooperate-with-famous-plugins#fugitive
command! -bang -nargs=* -complete=file Make AsyncRun -save=1 -program=make @ <args>

augroup AsyncRunQuickfixStatus
  autocmd!
  autocmd BufWinEnter quickfix setlocal
        \ statusline=%t\ [%{g:asyncrun_status}]\ %{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P
augroup END

augroup AsyncRunOpenQuickFix
  autocmd!
  autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END
