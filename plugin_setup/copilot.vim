" Disable by default
augroup Copilot
  autocmd!
  autocmd VimEnter * Copilot disable
augroup END

" Allow enabling on demand
nmap <Leader>ce :Copilot enable<CR>
nmap <Leader>cd :Copilot disable<CR>
