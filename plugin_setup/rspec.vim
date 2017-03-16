let g:rspec_command = 'rspec {spec}'

map <Leader>rf :wall<CR>:call RunCurrentSpecFile()<CR>
map <Leader>rc :wall<CR>:call RunNearestSpec()<CR>
map <Leader>rl :wall<CR>:call RunLastSpec()<CR>
map <Leader>ra :wall<CR>:call RunAllSpecs()<CR>
