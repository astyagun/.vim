function! OpenInNetRW() abort
  call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
endfunction
