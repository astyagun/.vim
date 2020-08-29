let g:user_emmet_leader_key = "<C-z>"

let g:user_emmet_install_global = 0
augroup EmmetInstallCustom
  autocmd!
  autocmd FileType html,css EmmetInstall
augroup END
