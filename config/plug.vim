call plug#begin()

" Visual {{{ "

Plug 'arzg/vim-colors-xcode'
" Plug 'rakr/vim-one'
Plug 'chrisbra/Colorizer'
Plug 'gerw/vim-HiLinkTrace', {'on': 'HLT'}
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'vim-scripts/errormarker.vim'
Plug 'xtal8/traces.vim'
Plug 'PeterRincker/vim-searchlight'

" }}} Visual "

" Navigation and window management {{{ "

Plug '/usr/local/opt/fzf'
Plug 'Konfekt/FastFold'
Plug 'haya14busa/vim-edgemotion'
Plug 'henrik/vim-indexed-search' " Show 'Match 123 of 456 /search term/' in Vim searches
Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-unimpaired'
Plug 'tyru/open-browser.vim'
Plug 'wesQ3/vim-windowswap'

" }}} Navigation and window management "

" Editing {{{ "

Plug 'AndrewRadev/splitjoin.vim'
Plug 'beloglazov/vim-online-thesaurus', {'on': ['OnlineThesaurusCurrentWord', 'OnlineThesaurusLookup', 'Thesaurus']}
Plug 'bkad/CamelCaseMotion'
Plug 'danchoi/ruby_bashrockets.vim', {'for': ['ruby', 'eruby', 'haml']}
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-operator-user'
Plug 'lyokha/vim-xkbswitch'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'andymass/vim-matchup'
Plug 'tmsvg/pear-tree'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/LargeFile'
Plug 'vim-scripts/YankRing.vim'

" }}} Editing "

" Text objects {{{ "

Plug 'Julian/vim-textobj-variable-segment'
Plug 'bootleq/vim-textobj-rubysymbol', {'for': ['ruby', 'eruby', 'haml']}
Plug 'coderifous/textobj-word-column.vim'
Plug 'glts/vim-textobj-comment'
Plug 'jceb/vim-textobj-uri'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'saihoooooooo/vim-textobj-space'
Plug 'sgur/vim-textobj-parameter'
Plug 'tek/vim-textobj-ruby', {'for': ['ruby', 'eruby', 'haml']}
Plug 'wellle/targets.vim'
Plug 'whatyouhide/vim-textobj-erb', {'for': 'eruby'}
Plug 'whatyouhide/vim-textobj-xmlattr', {'for': ['html', 'eruby']}

" }}} Text objects "

" File types {{{ "

Plug 'asux/vim-capybara'
Plug 'davidoc/taskpaper.vim', {'for': 'taskpaper'}
Plug 'kannokanno/previm', {'on': 'PrevimOpen'} " Markdown and Mermaid live preview with :PrevimOpen command
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'martinda/Jenkinsfile-vim-syntax', {'for': 'Jeninsfile'}
Plug 'mechatroner/rainbow_csv', {'for': 'csv'}
Plug 'pearofducks/ansible-vim', {'for': ['yaml.ansible', 'ansible_hosts', 'jinja2', '*.jinja2']}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'slim-template/vim-slim', {'for': 'slim'}
Plug 'sudar/vim-arduino-syntax', {'for': 'arduino'}
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml', {'for': 'haml'}
Plug 'vim-ruby/vim-ruby', {'for': ['ruby', 'eruby']}
Plug 'vim-scripts/confluencewiki.vim', {'for': 'confluencewiki'}
Plug 'wannesm/wmgraphviz.vim', {'for': 'dot'}
Plug 'zinit-zsh/zinit-vim-syntax'

" }}} File types "

" Integrations {{{ "

Plug 'emilsoman/spec-outline.vim', {'for': 'ruby'}
Plug 'janko-m/vim-test', {'for': 'ruby'} " Depends on skywind3000/asyncrun.vim
Plug 'lambdalisue/vim-gista'
Plug 'lucapette/vim-ruby-doc', {'for': 'ruby'}
Plug 'mhinz/vim-signify'
Plug 'rbong/vim-flog'
Plug 'samoshkin/vim-mergetool'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 't9md/vim-ruby-xmpfilter', {'for': 'ruby'}
Plug 'tpope/vim-eunuch' " Unix commands
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" }}} Integrations "

" Snippets and other insertions {{{ "

Plug 'SirVer/ultisnips'
Plug 'alvan/vim-closetag', {'for': 'html'}
Plug 'honza/vim-snippets'
Plug 'vim-scripts/ColorX'

" }}} Snippets and other insertions "

" Performance profiling {{{ "

" Plug 'tweekmonster/startuptime.vim'

" }}} Performance profiling "

call plug#end()
