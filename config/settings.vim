set encoding=utf-8
scriptencoding utf-8

" General {{{

" Save files before compilation
set autowrite
" Syntax and file types
if !exists('g:syntax_on')
  syntax on
endif
filetype plugin indent on
set rubydll=/usr/lib/libruby.dylib
set nomodeline
set termwinkey=†

" }}} General

" Formatting {{{

set autoindent
set cinwords=unless,def,class,if,else,elsif,while,for,switch
set conceallevel=2
set formatoptions=croqnj
set linespace=4
set nosmartindent
set preserveindent
set shiftround
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set textwidth=120

" }}} Formatting

" Visual {{{

let &colorcolumn = &textwidth + 1
let &listchars = "tab:\uBB\uBB,trail:\uB7,nbsp:~"
let &showbreak = '> '
set breakindent
set cmdheight=1
set cursorline
set fillchars=vert:│,fold:·
set guioptions-=rL
set laststatus=2
set linebreak " Wrap lines at convenient points
set list
set noballooneval
set noerrorbells visualbell t_vb=
set number
set ruler
set scrolloff=2
set shortmess+=c
set showcmd
set showmode
set showtabline=1
set sidescrolloff=5
set signcolumn=auto
set updatetime=300
set wrap

augroup CursorLine
  autocmd!
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" }}} Visual

" Navigation {{{

let &grepprg = 'rg --vimgrep --hidden --no-ignore-vcs --ignore-file ~/.files/zsh/find.ignore'
set confirm
set diffopt=filler,vertical,hiddenoff,internal,indent-heuristic,algorithm:patience
set foldcolumn=1
set foldlevel=0
set foldmethod=marker
set foldminlines=2
set foldnestmax=10
set grepformat=%f:%l:%c:%m
set hidden
set ignorecase
set nofoldenable
set norelativenumber
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

set iminsert=0
set imsearch=0
set nobomb
set noimcmdline
set nomacmeta
set nospell
set spelllang=ru_yo,en_us
set wildignore=*.o,*.obj,*~,vendor/bundle/**/* " Stuff to ignore when tab completing
set wildmenu " Enable <C-n> and <C-p> to scroll through matches
set wildmode=longest,list:longest,full " Make cmdline tab completion similar to bash

if has('nvim')
  set inccommand=split
endif

" }}} Editing

" Command line {{{

set shell=/bin/zsh
set shellcmdflag=-lc

" }}} Command line

" CScope {{{

set cscopequickfix=s-,c-,d-,i-,t-,e-
set cscopetag cscopeverbose

" }}} CScope
