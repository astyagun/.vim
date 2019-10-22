" Highlight merge conflict markers
augroup HighlightMergeConflictMarkers
  autocmd!
  autocmd Syntax * syntax match MergeConflictMarker containedin=ALL /\v^[><\|=]{7}( .*)?$/
augroup END
highlight link MergeConflictMarker Error

command! FindMergeConflictMarkers normal /\v^[><\|=]{7}( .*)?$<CR>
command! GrepMergeConflictMarkers grep '[><\\|=]{7}( .*)?$'
