let g:test#ruby#rspec#executable = 'rspec'
let g:test#ruby#rspec#options = '--no-profile'
let g:test#strategy = 'asyncrun'

function! TestDockerTransform(cmd) abort
  let l:container_name = systemlist('dkc-executable-container')[0]
  let l:cmd_prefix = ""
  if l:container_name ==# "spring"
    let l:cmd_prefix = "spring "
  end

  return 'docker-compose exec -T ' . l:container_name
        \. ' bash -c ' . shellescape('RUBYOPT=-W0 NO_COVERAGE=true RAILS_ENV=test ' . l:cmd_prefix . a:cmd)
endfunction
let g:test#custom_transformations = {'docker': function('TestDockerTransform')}
let g:test#transformation = 'docker'

nmap <silent> <Leader>tn :wall<CR>:TestNearest<CR>
nmap <silent> <Leader>tf :wall<CR>:TestFile<CR>
nmap <silent> <Leader>ta :wall<CR>:TestSuite<CR>
nmap <silent> <Leader>tl :wall<CR>:TestLast<CR>
nmap <silent> <Leader>tv :wall<CR>:TestVisit<CR>
nmap <silent> <Leader>tr :AsyncRun true<CR>
