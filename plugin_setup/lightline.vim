set laststatus=2
let g:lightline = {
      \   'colorscheme': 'solarized'
      \ }

augroup LightlineReload
  autocmd!
  autocmd User ConfigurationReloaded
        \ call lightline#init() |
        \ call lightline#colorscheme() |
        \ call lightline#update()
augroup END
