set encoding=utf-8
scriptencoding utf-8

" General {{{

filetype plugin indent on
set autowrite
set nomodeline
set rubydll=/usr/lib/libruby.dylib
set termwinkey=† " Free up <C-w> for delete a word backwards. Use <C-\><C-n> to return to NORMAL mode.
syntax on

" }}} General

" Encoding {{{

language messages ru_RU.UTF-8
set langmenu=ru_RU.UTF-8

" }}} Encoding

" Formatting {{{

set autoindent
set conceallevel=2
set expandtab
set formatoptions=crqnj
set shiftround
set shiftwidth=0 " Use 'tabstop' value
set softtabstop=-1 " Use 'shiftwidth' value
set tabstop=2

augroup AfterFormatOptions
  autocmd!
  autocmd FileType * setlocal formatoptions-=o
augroup END

" }}} Formatting

" Visual {{{

let &listchars = "tab:->,trail:\uB7,nbsp:~"
set belloff=all
set cmdheight=2
set colorcolumn=+1
set cursorline
set display+=lastline
set fillchars=vert:│,fold:·
set laststatus=2
set linebreak " Wrap lines at convenient points
set list
set noruler " Allows <C-g> to show line information
set shortmess+=c
set shortmess-=S
set showcmd
set sidescrolloff=5
set signcolumn=yes
set smoothscroll
set updatetime=300

augroup CursorLine
  autocmd!
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

augroup NoLongLinesOnly
  autocmd!
  autocmd BufRead,BufNewFile * call s:SetOptionsForFilesWithoutLongLines()
augroup END

function! s:SetOptionsForFilesWithoutLongLines() abort
  let l:file_has_long_lines = search('\%>3000c', 'nw') != 0

  if l:file_has_long_lines
    " Set default values for files with long lines to enhance performance
    setlocal showbreak=
    setlocal nobreakindent
    setlocal foldtext=foldtext()
    setlocal scrolloff=0
  else
    " Customize options for normal files
    " These options slow down moving through long lines
    let &l:showbreak = '> '
    setlocal breakindent
    setlocal foldtext=g:FoldText()
    setlocal scrolloff=2
  endif
endfunction

" }}} Visual

" Navigation {{{

let &grepprg = 'rg --vimgrep --hidden --no-ignore-vcs --ignore-file ~/.files/zsh/find.ignore'
set confirm
set diffopt=filler,closeoff,vertical,hiddenoff,internal,indent-heuristic,algorithm:patience
set foldmethod=indent
set foldminlines=2
set foldnestmax=10
set foldopen-=block
set grepformat=%f:%l:%c:%m
set hidden
set ignorecase
set nostartofline
set sessionoptions-=options
set smartcase
set smoothscroll

augroup PreviewWindowFolding
  autocmd!
  autocmd BufReadPre * if &previewwindow | setlocal nofoldenable | endif
augroup END

" }}}

" Search {{{

set hlsearch
set incsearch
set notagbsearch

" }}} Search

" Editing {{{

set completeopt=menuone,popup
set nojoinspaces
set spelllang=ru_yo,en_us
set wildignore=*.o,*.obj,*~,vendor/bundle/**/* " Stuff to ignore when tab completing
set wildmenu " Enable <C-n> and <C-p> to scroll through matches
set wildmode=longest,list:longest,full " Make cmdline tab completion similar to bash
set wildoptions=fuzzy

" }}} Editing

" Command line {{{

set shell=/bin/zsh
set shellcmdflag=-c

" }}} Command line
