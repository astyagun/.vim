" Add lines before and after current
nnoremap <D-S-CR> O<Esc>
inoremap <D-S-CR> <Esc>O
nnoremap <D-CR> o<Esc>
inoremap <D-CR> <Esc>o

" Insert time stamps
imap <C-X>d <C-R>=strftime("%d.%m.%Y")<CR>
imap <C-X>D <C-R>=strftime("%Y.%m.%d")<CR>
imap <C-X>t <C-R>=strftime("%H:%M")<CR>
