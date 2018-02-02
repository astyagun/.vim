let g:test#ruby#rspec#executable = './bin/rspec'
let g:test#ruby#rspec#options = '--require=./tmp/vim_formatter --format VimFormatter'

function! TestAsyncRunStrategy(cmd)
  execute 'AsyncRun! -save=1 ' . a:cmd
endfunction
let g:test#custom_strategies = {'custom_asyncrun': function('TestAsyncRunStrategy')}
let g:test#strategy = 'custom_asyncrun'

function! TestDockerTransform(cmd) abort
  return 'docker-compose exec -T spring bash -c "NO_COVERAGE=true ' . a:cmd . '"'
endfunction
let g:test#custom_transformations = {'docker': function('TestDockerTransform')}
let g:test#transformation = 'docker'

nmap <silent> <Leader>tn :wall<CR>:TestNearest<CR>
nmap <silent> <Leader>tf :wall<CR>:call <SID>TestProjectFile()<CR>
nmap <silent> <Leader>ta :wall<CR>:TestSuite<CR>
nmap <silent> <Leader>tl :wall<CR>:TestLast<CR>
nmap <silent> <Leader>tv :wall<CR>:TestVisit<CR>

" Find test file to run based on projections
function! s:TestProjectFile()
  let test_path = ''

  if !empty('b:projectionist')
    for [value] in projectionist#query_file('test')
      let test_path = value
      break
    endfor
  endif

  if !empty(test_path)
    TestFile test_path
  else
    TestFile
  endif
endfunction

command! CopyVimFormatter !cp ~/.vim/runtime/vim_formatter.rb ./tmp/
