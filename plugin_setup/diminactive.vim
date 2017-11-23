let g:diminactive_enable_focus = 1

augroup DiminactiveColorColumn
  autocmd!
  " It requires late execution for some reason
  autocmd User ConfigurationLoaded highlight ColorColumn guibg=#F5F5F5
augroup END

augroup DiminactiveDisableForPreviewWindow
  autocmd!
  autocmd BufAdd * if &previewwindow | execute "DimInactiveWindowOff" | endif
augroup END
