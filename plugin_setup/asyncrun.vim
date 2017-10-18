" https://github.com/skywind3000/asyncrun.vim/wiki/Cooperate-with-famous-plugins#fugitive
command! -bang -nargs=* -complete=file Make set eventignore= | AsyncRun -save=1 -program=make @ <args>

augroup AsyncRunOpenQuickFix
  autocmd!
  autocmd User AsyncRunStop if g:asyncrun_status == 'failure' | call asyncrun#quickfix_toggle(10, 1) | endif
augroup END

" Mapping for compiler
noremap <D-b> :Make<CR>
