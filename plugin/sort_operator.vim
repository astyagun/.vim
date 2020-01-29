map gs <Plug>(operator-sort)
call operator#user#define('sort', 'SortOperator')

function! SortOperator(motion_wiseness) abort
  '[,']sort
endfunction
