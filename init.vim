function! s:SourceFilesFromDirectory(directory_name) abort
  for file_path in split(glob('~/.vim/' . a:directory_name . '/*.vim'), '\n')
    execute 'source ' . file_path
  endfor
endfunction

" Make sure only :py3 is used
py3 ''

call s:SourceFilesFromDirectory('plugin_setup')
source ~/.vim/config/plug.vim

source ~/.vim/config/settings.vim
source ~/.vim/config/colors.vim
source ~/.vim/config/gui.vim
source ~/.vim/config/keyboard.vim

call s:SourceFilesFromDirectory('my_plugin')
