map <Leader>s <Plug>(operator-sort)
call operator#user#define('sort', 'SortOperator')

function! SortOperator(motion_wiseness)
  '[,']sort n
endfunction
