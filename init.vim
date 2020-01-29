for file_path in split(glob('~/.vim/plugin_setup/*.vim'), '\n')
  execute 'source ' . file_path
endfor
source ~/.vim/config/plug.vim

source ~/.vim/config/settings.vim
source ~/.vim/config/colors.vim
source ~/.vim/config/gui.vim
source ~/.vim/config/keyboard.vim
