map gs <Plug>(operator-sort)
map <Leader>gs <Plug>(operator-sort-reverse)
call operator#user#define('sort', 'SortOperator')
call operator#user#define('sort-reverse', 'SortReverseOperator')

function! SortOperator(motion_wiseness) abort
  '[,']sort
endfunction

function! SortReverseOperator(motion_wiseness) abort
  '[,']sort!
endfunction
