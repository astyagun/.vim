syntax keyword mdTodo FIXME NOTE TODO OPTIMIZE HACK REVIEW XXX todo
highlight default link mdTodo Todo

augroup MarkdowSyntaxClear
  autocmd!
  autocmd BufEnter *.md,*.mdown,*.markdown syntax clear markdownCodeBlock,markdownUrlLinkInText " Fixes lag
augroup END
