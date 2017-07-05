" SumDurations
"
" Vim command to calculate the sum of time durations written in format like '1h 30m'
" The sum is displayed with :echo command
"
" Usage example:
"
" Having this text:
"
"   Estimation:
"     * 1h Install the system
"     * 1h 30m Import seed data
"
" Select the paragraph in VISUAL mode and run the command `:'<,'>SumDurations`
"
" The will echo: '2h 30m'

command! -nargs=0 -range SumDurations <line1>,<line2>call s:SumDurations()

function! s:SumDurations() range
  let hits     = s:GatherDuration(a:firstline, a:lastline)
  let minutes  = s:Hits2Minutes(hits)
  let duration = s:Minutes2Duration(minutes)

  call s:ProduceOutput(duration)
endfunction

function! s:GatherDuration(line1, line2)
  let duration_pattern = '\v(\d+[hm])'
  let hits = []

  for line in getline(a:line1, a:line2)
    " matchstr() returns only on match, so splitting the line by white space before matching
    let line_hits = map(split(line), {key, value -> matchstr(value, duration_pattern)})
    " Clear empty List items
    let line_hits = filter(line_hits, {i, value -> len(value) > 0})

    call extend(hits, line_hits)
  endfor

  return hits
endfunction

function! s:Hits2Minutes(hits)
  let minutes = 0

  for hit in a:hits
    if hit =~ 'h$'
      let minutes += str2nr(hit) * 60
    endif
    if hit =~ 'm$'
      let minutes += str2nr(hit)
    endif
  endfor

  return minutes
endfunction

function! s:Minutes2Duration(minutes)
  let hours   = a:minutes / 60
  let minutes = a:minutes % 60

  return hours . 'h ' . minutes . 'm'
endfunction

function! s:ProduceOutput(duration)
  redraw
  echo a:duration
endfunction
