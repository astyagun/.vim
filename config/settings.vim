set encoding=utf-8
scriptencoding utf-8

" General {{{

set nocompatible
" Save files before compilation
set autowrite
" Syntax and file types
if !exists('g:syntax_on')
  syntax on
endif
filetype plugin indent on

" }}} General

" Visual {{{

let &listchars = "tab:\uBB\uBB,trail:\uB7,nbsp:~"
let &showbreak = '> '
set breakindent
set cmdheight=2
set colorcolumn=111
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
set showcmd
set showmode
set showtabline=1
set sidescrolloff=5
set signcolumn=auto
set wrap      " Wrap lines

augroup CursorLine
  autocmd!
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" }}} Visual

" Navigation {{{

let &grepprg = 'rg --vimgrep --hidden --no-ignore-vcs --ignore-file ~/.vim/runtime/grep.ignore'
set confirm
set diffopt=filler,vertical
set foldcolumn=1
set foldenable
set foldlevel=0
set foldmethod=marker
set foldnestmax=3
set grepformat=%f:%l:%c:%m
set hidden
set ignorecase
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

" Formatting {{{

set autoindent
set cinwords=unless,def,class,if,else,elsif,while,for,switch
set conceallevel=2
set formatoptions=croqnj
set linespace=1
set nosmartindent
set preserveindent
set shiftround
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set textwidth=110

" }}} Formatting

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
set shellcmdflag=-c

" }}} Command line

" CScope {{{

set cscopequickfix=s-,c-,d-,i-,t-,e-
set cscopetag cscopeverbose

" }}} CScope
