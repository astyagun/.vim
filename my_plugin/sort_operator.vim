map <Leader>S <Plug>(operator-sort)
call operator#user#define('sort', 'SortOperator')

function! SortOperator(motion_wiseness)
  '[,']sort
endfunction
