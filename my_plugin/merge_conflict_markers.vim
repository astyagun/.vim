" Highlight merge conflict markers
augroup HighlightMergeConflictMarkers
  autocmd!
  autocmd Syntax * syntax match MergeConflictMarker containedin=ALL /^\(<\{7,\}\||\{7,\}\|=\{7,\}\|>\{7,\}\)\( .*\)\?$/
augroup END
highlight link MergeConflictMarker Error

command! FindMergeConflictMarkers normal /^\(<\{7,\}\||\{7,\}\|=\{7,\}\|>\{7,\}\)\( .*\)\?$<CR>
