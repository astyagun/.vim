call plug#begin()

" Visual
Plug 'nelstrom/vim-mac-classic-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gerw/vim-HiLinkTrace'

" Navigation and window management
Plug 'CmdlineComplete'
Plug 'mhinz/vim-startify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'tpope/vim-unimpaired'
Plug 'wincent/ferret'
Plug 'majutsushi/tagbar'
Plug 'nixprime/cpsm', {'do': 'PY3=OFF ./install.sh'}
Plug 'haya14busa/incsearch.vim'

" Editing
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'henrik/vim-indexed-search' " Show 'Match 123 of 456 /search term/' in Vim searches
Plug 'vim-scripts/YankRing.vim'
Plug 'lyokha/vim-xkbswitch'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'bkad/CamelCaseMotion'
Plug 'kana/vim-smartinput' " Closes quotes and parentheses pairs
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'danchoi/ruby_bashrockets.vim'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-abolish'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'beloglazov/vim-online-thesaurus'

" Text objects
Plug 'bootleq/vim-textobj-rubysymbol'
Plug 'coderifous/textobj-word-column.vim'
Plug 'jceb/vim-textobj-uri'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-lastpat'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'saihoooooooo/vim-textobj-space'
Plug 'tek/vim-textobj-ruby'
Plug 'vim-scripts/argtextobj.vim'
Plug 'whatyouhide/vim-textobj-erb'
Plug 'whatyouhide/vim-textobj-xmlattr'
" Conflict with word column text object (c character)
" Plug 'jasonlong/vim-textobj-css'
" Plug 'glts/vim-textobj-comment'

" File types
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml'
Plug 'plasticboy/vim-markdown'
Plug 'asux/vim-capybara'
Plug 'kannokanno/previm'

" Integrations
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'
Plug 'neilagabriel/vim-geeknote'
Plug 'tpope/vim-eunuch' " Unix commands
Plug 'tpope/vim-rails'
Plug 't9md/vim-ruby-xmpfilter'
Plug 'w0rp/ale'
Plug 'thoughtbot/vim-rspec'
Plug 'emilsoman/spec-outline.vim'
Plug 'lucapette/vim-ruby-doc'
" Another option for Arduino development: https://github.com/sudar/Arduino-Makefile
Plug 'stevearc/vim-arduino'

" Snippets and other insertions
" This script lets you insert hex or RGB color codes directly into the buffer by using OS X's color picker
Plug 'vim-scripts/ColorX'
Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'sudar/vim-arduino-snippets'

" Performance profiling
" Plug 'tweekmonster/startuptime.vim'

call plug#end()
