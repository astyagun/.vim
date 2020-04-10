let g:test#ruby#rspec#executable = './bin/rspec'
let g:test#ruby#rspec#options = '--no-profile --require=./tmp/vim_formatter --format VimFormatter'

function! TestAsyncRunStrategy(cmd) abort
  execute 'AsyncRun! -save=1 ' . a:cmd
endfunction
let g:test#custom_strategies = {'custom_asyncrun': function('TestAsyncRunStrategy')}
let g:test#strategy = 'custom_asyncrun'

function! TestDockerTransform(cmd) abort
  let l:container_name = systemlist('dkc-executable-container')[0]
  return 'docker-compose exec -T ' . l:container_name . ' bash -c "RUBYOPT=-W0 NO_COVERAGE=true ' . a:cmd . '"'
endfunction
let g:test#custom_transformations = {'docker': function('TestDockerTransform')}
let g:test#transformation = 'docker'

nmap <silent> <Leader>tn :wall<CR>:TestNearest<CR>
nmap <silent> <Leader>tf :wall<CR>:TestFile<CR>
nmap <silent> <Leader>ta :wall<CR>:TestSuite<CR>
nmap <silent> <Leader>tl :wall<CR>:TestLast<CR>
nmap <silent> <Leader>tv :wall<CR>:TestVisit<CR>

command! CopyVimFormatter !cp ~/.vim/runtime/vim_formatter.rb ./tmp/
