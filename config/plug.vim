call plug#begin()

" Visual {{{ "
Plug 'nelstrom/vim-mac-classic-theme'
Plug 'gerw/vim-HiLinkTrace', {'on': 'HLT'}
" Plug 'vim-scripts/errormarker.vim'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'itchyny/lightline.vim'
Plug 'chrisbra/Colorizer'
" }}} Visual "

" Navigation and window management {{{ "
Plug 'mhinz/vim-startify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'tpope/vim-unimpaired'
Plug 'wincent/ferret'
Plug 'nixprime/cpsm', {'do': 'PY3=OFF ./install.sh'}
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-projectionist'
Plug 'kshenoy/vim-signature'
" }}} Navigation and window management "

" Editing {{{ "
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'henrik/vim-indexed-search' " Show 'Match 123 of 456 /search term/' in Vim searches
Plug 'vim-scripts/YankRing.vim'
Plug 'lyokha/vim-xkbswitch'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'bkad/CamelCaseMotion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'danchoi/ruby_bashrockets.vim', {'for': ['ruby', 'eruby', 'haml']}
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-abolish'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'beloglazov/vim-online-thesaurus',
      \ {'on': ['OnlineThesaurusCurrentWord', 'OnlineThesaurusLookup', 'Thesaurus']}
" }}} Editing "

" Autocomplete {{{ "
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'prabirshrestha/asyncomplete-tags.vim'
Plug 'yami-beta/asyncomplete-omni.vim'
" }}} Autocomplete "

" Text objects {{{ "
Plug 'bootleq/vim-textobj-rubysymbol', {'for': ['ruby', 'eruby', 'haml']}
Plug 'coderifous/textobj-word-column.vim'
Plug 'jceb/vim-textobj-uri'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'saihoooooooo/vim-textobj-space'
Plug 'tek/vim-textobj-ruby', {'for': ['ruby', 'eruby', 'haml']}
Plug 'vim-scripts/argtextobj.vim'
Plug 'whatyouhide/vim-textobj-erb', {'for': 'eruby'}
Plug 'whatyouhide/vim-textobj-xmlattr', {'for': ['html', 'eruby']}
Plug 'glts/vim-textobj-comment'
" Conflict with word column text object (c character)
" Plug 'jasonlong/vim-textobj-css'
Plug 'sgur/vim-textobj-parameter'
" }}} Text objects "

" File types {{{ "
Plug 'vim-ruby/vim-ruby', {'for': ['ruby', 'eruby']}
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml', {'for': 'haml'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'asux/vim-capybara'
Plug 'JamshedVesuna/vim-markdown-preview', {'for': 'markdown'}
Plug 'vim-scripts/confluencewiki.vim', {'for': 'confluencewiki'}
Plug 'dart-lang/dart-vim-plugin'
" }}} File types "

" Integrations {{{ "
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'mhinz/vim-signify'
Plug 'neilagabriel/vim-geeknote', {'on': 'Geeknote'}
Plug 'tpope/vim-eunuch' " Unix commands
Plug 'tpope/vim-rails', {'for': ['ruby', 'eruby']}
Plug 't9md/vim-ruby-xmpfilter', {'for': 'ruby'}
Plug 'w0rp/ale'
Plug 'janko-m/vim-test', {'for': 'ruby'}
  Plug 'skywind3000/asyncrun.vim'
Plug 'emilsoman/spec-outline.vim', {'for': 'ruby'}
Plug 'lucapette/vim-ruby-doc', {'for': 'ruby'}
" Another option for Arduino development: https://github.com/sudar/Arduino-Makefile
" Plug 'stevearc/vim-arduino'
Plug 'astashov/vim-ruby-debugger', {'for': 'ruby'}
" }}} Integrations "

" Snippets and other insertions {{{ "
" This script lets you insert hex or RGB color codes directly into the buffer by using OS X's color picker
Plug 'vim-scripts/ColorX'
Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  " Plug 'sudar/vim-arduino-snippets'
Plug 'alvan/vim-closetag', {'for': 'html'}
" }}} Snippets and other insertions "

" Performance profiling {{{ "
" Plug 'tweekmonster/startuptime.vim'
" }}} Performance profiling "

call plug#end()
