" SumDurations
"
" Vim command to calculate the sum of time durations written in format like '1h 30m' (or '3Y 5M')
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
"
" Calling command without a range counts durations on current line
"
" Providing bang (!) makes command count months (M) and years (Y)

command! -nargs=0 -range -bang SumDurations <line1>,<line2>call s:SumDurations(<bang>1)

let s:units = {
      \   'minutes': {'character': 'm', 'multiplier': 1},
      \   'hours':   {'character': 'h', 'multiplier': 60},
      \   'months':  {'character': 'M', 'multiplier': 1},
      \   'years':   {'character': 'Y', 'multiplier': 12}
      \ }

function! s:SumDurations(minutes_and_hours) range abort
  let l:selected_units = s:SelectedUnits(a:minutes_and_hours)
  let l:hits           = s:GatherDurations(a:firstline, a:lastline, l:selected_units)
  let l:low_units_sum  = s:Hits2LowUnitsSum(l:hits, l:selected_units)
  let l:duration       = s:LowUnits2DurationText(l:low_units_sum, l:selected_units)

  call s:ProduceOutput(l:duration)
endfunction

function! s:SelectedUnits(minutes_and_hours) abort
  if a:minutes_and_hours
    return {'low': s:units.minutes, 'high': s:units.hours}
  else
    return {'low': s:units.months, 'high': s:units.years}
  endif
endfunction

function! s:GatherDurations(line1, line2, selected_units) abort
  let l:units_characters = a:selected_units.low.character . a:selected_units.high.character
  let l:duration_pattern = '\v(\d+[' . l:units_characters . '])'
  let l:hits             = []

  let l:ignorecase = &ignorecase
  setlocal noignorecase

  for l:line in getline(a:line1, a:line2)
    " matchstr() returns only one match, so splitting the line by white space before matching
    let l:line_hits = map(split(l:line), {key, value -> matchstr(value, l:duration_pattern)})
    " Clear empty List items
    let l:line_hits = filter(l:line_hits, {i, value -> len(value) > 0})

    call extend(l:hits, l:line_hits)
  endfor

  let &ignorecase = l:ignorecase
  return l:hits
endfunction

function! s:Hits2LowUnitsSum(hits, selected_units) abort
  let l:units_sum = 0

  for l:hit in a:hits
    for [l:unit_type, l:unit] in items(a:selected_units)
      if l:hit =~ l:unit.character . '$'
        let l:units_sum += str2nr(l:hit) * l:unit.multiplier
      endif
    endfor
  endfor

  return l:units_sum
endfunction

function! s:LowUnits2DurationText(units, selected_units) abort
  let l:divider    = a:selected_units.high.multiplier
  let l:high_units = a:units / l:divider
  let l:low_units  = a:units % l:divider
  let l:output     = ''

  if l:high_units > 0
    let l:output = l:high_units . a:selected_units.high.character . ' '
  endif

  return l:output . l:low_units . a:selected_units.low.character
endfunction

function! s:ProduceOutput(duration) abort
  redraw
  echo a:duration
endfunction
