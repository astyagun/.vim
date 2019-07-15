" Highlight merge conflict markers
augroup HighlightMergeConflictMarkers
  autocmd!
  autocmd Syntax * syntax match MergeConflictMarker containedin=ALL /\%(<<<<<<<\|=======\|>>>>>>>\)/
augroup END
highlight link MergeConflictMarker Error

command! FindMergeConflictMarkers normal /\%(<<<<<<<\|=======\|>>>>>>>\)<CR>
