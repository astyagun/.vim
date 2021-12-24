function! s:SourceFilesFromDirectory(directory_name) abort
  for file_path in split(glob('~/.vim/' . a:directory_name . '/*.vim'), '\n')
    execute 'source ' . file_path
  endfor
endfunction

" Make sure current version of Python 3 is used
py3 ''

source ~/.vim/config/load_shell_environment.vim

let g:sidebar_width = 30

call s:SourceFilesFromDirectory('plugin_setup')
source ~/.vim/config/plug.vim

source ~/.vim/config/options.vim
source ~/.vim/config/colors.vim
source ~/.vim/config/gui.vim
source ~/.vim/config/keyboard.vim
source ~/.vim/config/abbreviations.vim

call s:SourceFilesFromDirectory('my_plugin')
