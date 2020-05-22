" Markdown produced by Joplin doesn't perfectly match the desired Markdown format, that I use in Vimwiki. So:
" - Make the first line a header
" - Fix checkboxes having two dashes in a row
" - Fix number of spaces in lists indentation

command! ConvertNoteFromJoplin call <SID>ConvertNoteFromJoplin()

function! s:ConvertNoteFromJoplin() abort
  1s/^\([^#]\)/# \1/e
  %s/^\(\s*\)- -/\1-/e
  RetabJoplin
endfunction
