set encoding=utf-8
scriptencoding utf-8

" General
set nocompatible
" Save files before compilation
set autowrite
" Syntax and file types
if !exists('g:syntax_on')
  syntax on
endif
filetype plugin indent on

" Visual
set cursorline
augroup CursorLine
  autocmd!
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END
" Lines number
set number
set ruler
" Disable beeps and flashes
set noerrorbells visualbell t_vb=
" Show tabs (not symbols)
set showtabline=1
set showcmd
set showmode
set cmdheight=2
set scrolloff=2
set sidescrolloff=5
set wrap      " Wrap lines
set linebreak " Wrap lines at convenient points
set breakindent
let &showbreak = '> '
let &listchars = "tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list
set noballooneval
set laststatus=2
set signcolumn=auto
set guioptions-=rL
set colorcolumn=111

" Navigation
" Hide buffers when not displayed
set hidden
" Folding settings
set foldmethod=marker
set foldcolumn=0
set foldlevel=0
set foldnestmax=3
set nofoldenable
set sessionoptions-=options
set diffopt=filler,vertical
set scrolloff=2
set nostartofline
set ignorecase
set smartcase
set norelativenumber
set confirm

" Search
" Highlight search
set hlsearch
" Highlight matches when typing search pattern
set incsearch
" Turn tag binary search off
set notagbsearch

" Formatting
set autoindent
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set linespace=1
" Round indent to multiple of 'shiftwidth'
set shiftround
set nosmartindent
set preserveindent
" Keywords that start extra indent on next line
set cinwords=unless,def,class,if,else,elsif,while,for,switch
set formatoptions=croqnj
set textwidth=110
set conceallevel=2

" Editing
"" Input method (localization)
set keymap=russian-jcukenwin
"set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl;'zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>
set noimcmdline
set iminsert=0
set imsearch=0
set nobomb
" Spell check
set spelllang=ru_yo,en_us
set nospell
set wildmode=longest,list:longest,full " Make cmdline tab completion similar to bash
set wildmenu " Enable <C-n> and <C-p> to scroll through matches
set wildignore=*.o,*.obj,*~,vendor/bundle/**/* " Stuff to ignore when tab completing
set nomacmeta

if has('nvim')
  set inccommand=split
endif

" Command line
set shell=/bin/zsh
set shellcmdflag=-c

" CScope
set cscopetag cscopeverbose
set cscopequickfix=s-,c-,d-,i-,t-,e-
