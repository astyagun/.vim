let g:markdown_enable_insert_mode_mappings = 0

augroup MarkdownCompiler
  autocmd!
  autocmd FileType markdown compiler markdown
augroup END
