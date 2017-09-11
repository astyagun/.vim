let g:diminactive_enable_focus = 1

augroup DiminactiveColorColumn
  autocmd!
  " It requires late execution for some reason
  autocmd FileType * highlight ColorColumn guibg=#F5F5F5
augroup END
