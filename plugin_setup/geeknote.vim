" let g:GeeknoteFormat             = 'plain'
let g:GeeknoteExplorerNodeClosed = '+'
let g:GeeknoteExplorerNodeOpened = '-'

map <D-E> :Geeknote<CR>

" Vim selects first Python version, that gets called and doesn't allow other
" version after that. Selecting Python 2 to allow vim-geeknote to work.
python ''

augroup Geeknote
  autocmd!
  autocmd FileType geeknote setlocal nospell nobuflisted
augroup END
