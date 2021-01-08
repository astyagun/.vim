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
set formatoptions=crqnj
set shiftround
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set textwidth=120

augroup AfterFormatOptions
  autocmd!
  autocmd FileType * setlocal formatoptions-=o
augroup END

" }}} Formatting

" Visual {{{

let &colorcolumn = &textwidth + 1
let &listchars = "tab:->,trail:\uB7,nbsp:~"
let &showbreak = '> '
set belloff=all
set breakindent
set cursorline
set fillchars=vert:│,fold:·
set foldtext=g:FoldText()
set laststatus=2
set linebreak " Wrap lines at convenient points
set list
set noruler " Allows <C-g> to show line information
set scrolloff=2
set shortmess+=c
set sidescrolloff=5
set signcolumn=yes
set updatetime=300

augroup CursorLine
  autocmd!
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" }}} Visual

" Navigation {{{

let &grepprg = 'rg --vimgrep --hidden --no-ignore-vcs --ignore-file ~/.files/zsh/find.ignore'
set confirm
set diffopt=filler,closeoff,vertical,hiddenoff,internal,indent-heuristic,algorithm:patience
set foldmethod=marker
set foldminlines=2
set foldnestmax=10
set foldopen-=block
set grepformat=%f:%l:%c:%m
set hidden
set ignorecase
set nostartofline
set sessionoptions-=options
set smartcase

" }}}

" Search {{{

set hlsearch
set incsearch
set notagbsearch

" }}} Search

" Editing {{{

set completeopt=menuone,popup
set spelllang=ru_yo,en_us
set wildignore=*.o,*.obj,*~,vendor/bundle/**/* " Stuff to ignore when tab completing
set wildmenu " Enable <C-n> and <C-p> to scroll through matches
set wildmode=longest,list:longest,full " Make cmdline tab completion similar to bash

" }}} Editing

" Command line {{{

set shell=/bin/zsh
set shellcmdflag=-lc

" }}} Command line
