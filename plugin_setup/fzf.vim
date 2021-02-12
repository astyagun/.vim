let g:fzf_action = {
      \   'ctrl-s': 'split',
      \   'ctrl-t': 'tab split',
      \   'ctrl-v': 'vsplit'
      \ }
let g:fzf_layout = #{down: 20}
let g:fzf_preview_window = 'right:hidden'

nnoremap <silent> <D-P> :doautocmd User BeforeFzfOpen <Bar> Files <C-r>=expand('%:h')<CR><CR>
nnoremap <silent> <D-p> :doautocmd User BeforeFzfOpen <Bar> Files<CR>

nnoremap <silent> <D-g> :doautocmd User BeforeFzfOpen <Bar> BTags<CR>
nnoremap <silent> <D-u> :doautocmd User BeforeFzfOpen <Bar> Buffers<CR>

augroup HideFZFStatusline
  autocmd!
  autocmd FileType fzf set laststatus=0 noshowmode
        \| autocmd BufLeave <buffer> set laststatus=2 showmode
augroup END

" Import fzf environment variables from shell {{{

augroup ImportFzfEnvironmentVariablesFromShell
  autocmd!
  autocmd User ShellEnvironmentLoaded call s:ImportFzfEnvironmentVariablesFromShell()
augroup END

function! s:ImportFzfEnvironmentVariablesFromShell() abort
  for environment_variable_name in filter(keys(g:ShellEnvironment), 'v:val =~# "^FZF_"')
    let l:variable_value = g:ShellEnvironment[environment_variable_name]
    let l:escaped_variable_value = substitute(l:variable_value, '"', '\\"', 'g')

    execute 'let $' . environment_variable_name . ' = "' . l:escaped_variable_value . '"'
  endfor
endfunction

" }}} Import fzf environment variables from shell

" Snippets {{{

" - Running this function without `<expr>` cuts the last character of current word from UltiSnips suggestions
" - Running `fzf#run()` directly causes E565
" - The hack with 2 maps solves it. Borrowed from `fzf#vim#complete`.
inoremap <expr> <C-x><C-j> <SID>FzfCompleteSnippet()
inoremap <silent> <Plug>(fzf-custom-snippet-complete-trigger) <C-o>:call <SID>FzfCompleteSnippetTrigger()<CR>

function! s:FzfCompleteSnippet() abort
  let s:fzf_snippet_options = fzf#wrap({
        \ "source": UltiSnips#SnippetsInCurrentScope()->keys(),
        \ "options": "--no-preview",
        \ "sink": function("s:FzfSnippedSelectedCallback")})
  call feedkeys("\<Plug>(fzf-custom-snippet-complete-trigger)")
  return ""
endfunction

function! s:FzfCompleteSnippetTrigger() abort
  call fzf#run(s:fzf_snippet_options)
endfunction

function! s:FzfSnippedSelectedCallback(snippet) abort
  let l:escaped_snippet = substitute(a:snippet, '^\s*\|\s*$', '', 'g')
  let l:enter_insert_mode_command = "ciw"
  if empty(expand("<cword>"))
    let l:enter_insert_mode_command = "a"
  endif

  call feedkeys(l:enter_insert_mode_command . l:escaped_snippet . "\<C-r>=UltiSnips#ExpandSnippet()\<CR>", "n")
endfunction

" }}} Snippets

" Ruby tags {{{

augroup FzfRubyBufferTags
  autocmd!
  autocmd FileType ruby nnoremap <buffer><silent> <D-g> :call <SID>FzfRubyBufferTags()<CR>
augroup END

function! s:FzfRubyBufferTags() abort
  let l:current_file = expand('%')
  if !filereadable(l:current_file)
    throw "Save the file first"
  endif

  let l:command = printf(
        \ "ripper-tags --tag-file - --excmd=number '%s' 2>/dev/null"
        \ . "| grep --invert-match '^!'"
        \ . "| cut -f 1,3,4"
        \ . "| sort --numeric-sort --key 2"
        \ . "| column -t"
        \ , l:current_file
        \ )
  let l:buffer_tags = split(system(l:command), "\n")
  if v:shell_error
    throw get(l:buffer_tags, 0, "Failed to extract tags")
  elseif empty(l:buffer_tags)
    throw "No tags found"
  endif

  call fzf#run(fzf#wrap({
        \ "source": l:buffer_tags,
        \ "options": "--no-preview",
        \ "sink": function("s:FzfRubyBufferTagsCallback")}))
endfunction

function! s:FzfRubyBufferTagsCallback(tag) abort
  let l:tag_line_number = substitute(split(a:tag)[1], ';"', '', '')
  execute "normal! " . l:tag_line_number . "Gzvzz^"
endfunction

" }}} Ruby tags
