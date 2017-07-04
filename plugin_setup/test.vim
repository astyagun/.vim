let g:test#strategy = 'asyncrun'
let test#ruby#minitest#options = '--format progress'

function! DockerTransform(cmd) abort
  return 'docker-compose exec -T tests ' . a:cmd
endfunction

let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#transformation = 'docker'

nmap <silent> <Leader>tn :wall<CR>:TestNearest<CR>
nmap <silent> <Leader>tf :wall<CR>:TestFile<CR>
nmap <silent> <Leader>ta :wall<CR>:TestSuite<CR>
nmap <silent> <Leader>tl :wall<CR>:TestLast<CR>
nmap <silent> <Leader>tv :wall<CR>:TestVisit<CR>
