call textobj#user#plugin("markdownlink", {
      \   "link": {
      \     "pattern": '\[[^\]]*\]([^)]\+)',
      \     "select": []
      \   }
      \ })

augroup MarkdownLinkTextobj
  autocmd!
  autocmd FileType markdown call textobj#user#map("markdownlink", {
        \   "link": {
        \     "select": ["<buffer> aU", "<buffer> iU"]
        \   }
        \ })
augroup END
