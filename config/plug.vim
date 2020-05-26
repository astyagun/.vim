call plug#begin()

" Visual {{{

Plug 'PeterRincker/vim-searchlight'
Plug 'arzg/vim-colors-xcode'
Plug 'chrisbra/Colorizer', #{on: 'ColorHighlight'}
Plug 'gerw/vim-HiLinkTrace', #{on: 'HLT'}
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'xtal8/traces.vim'

" Plug 'rhysd/vim-color-spring-night'

" }}} Visual

" Navigation and window management {{{

Plug '/usr/local/opt/fzf'
Plug 'Konfekt/FastFold'
Plug 'andymass/vim-matchup'
Plug 'haya14busa/vim-edgemotion'
Plug 'henrik/vim-indexed-search' " Show 'Match 123 of 456 /search term/' in Vim searches
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-unimpaired'
Plug 'tyru/open-browser.vim'

" }}} Navigation and window management

" Editing {{{

Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lyokha/vim-xkbswitch'
Plug 'mbbill/undotree', #{on: 'UndotreeToggle'}
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/LargeFile'
Plug 'vim-scripts/YankRing.vim'

" }}} Editing

" Snippets and other insertions {{{

Plug 'SirVer/ultisnips'
Plug 'alvan/vim-closetag', #{for: 'html'}
Plug 'honza/vim-snippets'
Plug 'tmsvg/pear-tree'

" }}} Snippets and other insertions

" Text objects and operators {{{

Plug 'Julian/vim-textobj-variable-segment'
Plug 'bkad/CamelCaseMotion'
Plug 'bootleq/vim-textobj-rubysymbol', #{for: ['ruby', 'eruby', 'haml']}
Plug 'coderifous/textobj-word-column.vim'
Plug 'glts/vim-textobj-comment'
Plug 'jceb/vim-textobj-uri'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'tek/vim-textobj-ruby', #{for: ['ruby', 'eruby', 'haml']}
Plug 'wellle/targets.vim'
Plug 'whatyouhide/vim-textobj-erb', #{for: 'eruby'}
Plug 'whatyouhide/vim-textobj-xmlattr', #{for: ['html', 'eruby']}

" }}} Text objects

" File types {{{

Plug 'kannokanno/previm', #{on: 'PrevimOpen'} " Markdown and Mermaid live preview with :PrevimOpen command
Plug 'kchmck/vim-coffee-script', #{for: 'coffee'}
Plug 'martinda/Jenkinsfile-vim-syntax', #{for: 'Jeninsfile'}
Plug 'mechatroner/rainbow_csv', #{for: 'csv'}
Plug 'pearofducks/ansible-vim', #{for: ['yaml.ansible', 'ansible_hosts', 'jinja2', '*.jinja2']}
Plug 'plasticboy/vim-markdown', #{for: 'markdown'}
Plug 'slim-template/vim-slim', #{for: 'slim'}
Plug 'sudar/vim-arduino-syntax', #{for: 'arduino'}
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml', #{for: 'haml'}
Plug 'vim-ruby/vim-ruby', #{for: ['ruby', 'eruby']}
Plug 'vim-scripts/confluencewiki.vim', #{for: 'confluencewiki'}
Plug 'zinit-zsh/zinit-vim-syntax'

" }}} File types

" Integrations {{{

Plug 'janko-m/vim-test', #{for: 'ruby'} " Depends on skywind3000/asyncrun.vim
Plug 'lambdalisue/vim-gista', #{on: 'Gista'}
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc.nvim', #{branch: 'release'}
Plug 'rbong/vim-flog', #{on: ['Flog', 'Flogsplit']}
Plug 'samoshkin/vim-mergetool', #{on: 'MergetoolStart'}
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'skywind3000/asyncrun.vim', #{on: 'AsyncRun'}
Plug 't9md/vim-ruby-xmpfilter', #{for: 'ruby'}
Plug 'tpope/vim-eunuch' " Unix commands
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'w0rp/ale'

" }}} Integrations

" Other {{{

Plug 'vimwiki/vimwiki', #{branch: 'dev'}

" }}} Other

" Performance profiling {{{

" Plug 'tweekmonster/startuptime.vim'

" }}} Performance profiling

call plug#end()

command! PC PlugClean
command! PI PlugInstall
command! PU PlugUpgrade <Bar> PlugUpdate
