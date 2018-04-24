call plug#begin()

" Visual {{{ "

Plug 'nelstrom/vim-mac-classic-theme'
Plug 'gerw/vim-HiLinkTrace', {'on': 'HLT'}
Plug 'vim-scripts/errormarker.vim'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'itchyny/lightline.vim'
Plug 'chrisbra/Colorizer'
Plug 'ap/vim-css-color'
Plug 'machakann/vim-highlightedyank'
Plug 'xtal8/traces.vim'

" }}} Visual "

" Navigation and window management {{{ "

Plug 'mhinz/vim-startify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'tpope/vim-unimpaired'
Plug 'nixprime/cpsm', {'do': 'PY3=OFF ./install.sh'}
Plug 'kshenoy/vim-signature'
Plug 'henrik/vim-indexed-search' " Show 'Match 123 of 456 /search term/' in Vim searches
Plug 'haya14busa/vim-edgemotion'
Plug 'tyru/open-browser.vim'
Plug 'jasoncodes/ctrlp-modified.vim'

" }}} Navigation and window management "

" Editing {{{ "

Plug 'tpope/vim-surround'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
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
Plug 'tommcdo/vim-exchange'
Plug 'vim-scripts/LargeFile'
Plug 'kana/vim-operator-user'
Plug 'henrik/vim-yaml-flattener'

" }}} Editing "

" Autocomplete {{{ "

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'yami-beta/asyncomplete-omni.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'

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
Plug 'whatyouhide/vim-textobj-erb', {'for': 'eruby'}
Plug 'whatyouhide/vim-textobj-xmlattr', {'for': ['html', 'eruby']}
Plug 'glts/vim-textobj-comment'
" Conflict with word column text object (c character)
" Plug 'jasonlong/vim-textobj-css'
Plug 'sgur/vim-textobj-parameter'
Plug 'wellle/targets.vim'
Plug 'Julian/vim-textobj-variable-segment'

" }}} Text objects "

" File types {{{ "

Plug 'vim-ruby/vim-ruby', {'for': ['ruby', 'eruby']}
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml', {'for': 'haml'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'asux/vim-capybara'
Plug 'JamshedVesuna/vim-markdown-preview', {'for': 'markdown'}
Plug 'vim-scripts/confluencewiki.vim', {'for': 'confluencewiki'}
" Markdown and Mermaid live preview with :PrevimOpen command
Plug 'kannokanno/previm', {'for': 'markdown'}
Plug 'wannesm/wmgraphviz.vim', {'for': 'dot'}
Plug 'slim-template/vim-slim', {'for': 'slim'}
Plug 'sudar/vim-arduino-syntax', {'for': ['ino', 'pde']}
Plug 'mechatroner/rainbow_csv', {'for': 'csv'}
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'martinda/Jenkinsfile-vim-syntax', {'for': 'Jeninsfile'}

" }}} File types "

" Integrations {{{ "

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-eunuch' " Unix commands
Plug 't9md/vim-ruby-xmpfilter', {'for': 'ruby'}
Plug 'w0rp/ale'
Plug 'janko-m/vim-test', {'for': 'ruby'}
  Plug 'skywind3000/asyncrun.vim'
Plug 'emilsoman/spec-outline.vim', {'for': 'ruby'}
Plug 'lucapette/vim-ruby-doc', {'for': 'ruby'}
Plug 'lambdalisue/vim-gista'
Plug 'lambdalisue/vim-gista-ctrlp'
Plug 'jreybert/vimagit'
Plug 'junegunn/gv.vim'

" }}} Integrations "

" Snippets and other insertions {{{ "

Plug 'vim-scripts/ColorX'
Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  " Plug 'sudar/vim-arduino-snippets'
Plug 'alvan/vim-closetag', {'for': 'html'}
Plug 'sudar/vim-arduino-snippets', {'for': ['ino', 'pde']}

" }}} Snippets and other insertions "

" Performance profiling {{{ "

" Plug 'tweekmonster/startuptime.vim'

" }}} Performance profiling "

call plug#end()
