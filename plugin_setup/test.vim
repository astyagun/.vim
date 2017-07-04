let g:test#strategy = 'asyncrun'
let test#ruby#minitest#options = '--format progress'

function! DockerTransform(cmd) abort
  return 'docker-compose exec -T tests ' . a:cmd
endfunction

let g:test#custom_transformations = {'docker': function('DockerTransform')}
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
    for [root, value] in projectionist#query('type')
      if value != 'test'
        for [root, value] in projectionist#query('test')
          let test_path = value
        endfor
      endif
    endfor
  endif

  if !empty(test_path)
    TestFile test_path
  else
    TestFile
  endif
endfunction
