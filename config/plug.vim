call plug#begin()

" Visual {{{

Plug 'arzg/vim-colors-xcode'
Plug 'chrisbra/Colorizer', #{on: 'ColorHighlight'}
Plug 'gerw/vim-HiLinkTrace', #{on: 'HLT'}
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-characterize'
Plug 'xtal8/traces.vim'

" Plug 'rhysd/vim-color-spring-night'

" }}} Visual

" Navigation and window management {{{

Plug 'AndrewRadev/bufferize.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'andymass/vim-matchup'
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'machakann/vim-columnmove'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'tyru/open-browser.vim'
packadd cfilter

if filereadable('/opt/homebrew/bin/brew')
  let s:homebrew_prefix = '/opt/homebrew'
else
  let s:homebrew_prefix = '/usr/local'
endif
execute 'set rtp+=' . s:homebrew_prefix . '/opt/fzf'

" }}} Navigation and window management

" Editing {{{

Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'gergap/vim-ollama', #{on: 'Ollama'}
Plug 'junegunn/vim-easy-align'
Plug 'lyokha/vim-xkbswitch'
Plug 'mbbill/undotree', #{on: 'UndotreeToggle'}
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/LargeFile'
Plug 'vim-scripts/YankRing.vim'

" Should probably be loaded after tpope/vim-rsi plugin
Plug 'ryvnf/readline.vim'

" }}} Editing

" Snippets and other insertions {{{

Plug 'SirVer/ultisnips'
Plug 'alvan/vim-closetag', #{for: 'html'}
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim', #{for: ['html', 'css'], on: 'EmmetInstall'}
Plug 'tpope/vim-endwise'

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
Plug 'tek/vim-textobj-ruby', #{for: ['ruby', 'eruby', 'haml']}
Plug 'whatyouhide/vim-textobj-erb', #{for: 'eruby'}
Plug 'whatyouhide/vim-textobj-xmlattr', #{for: ['html', 'eruby']}

" }}} Text objects

" File types {{{

Plug 'iamcco/markdown-preview.nvim', #{do: 'cd app && yarn install', for: ['markdown']}
Plug 'mechatroner/rainbow_csv', #{for: 'csv'}
Plug 'rickhowe/diffunitsyntax'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-liquid', #{for: 'liquid'}
Plug 'trapd00r/vidir', #{for: 'vidir'}
Plug 'vim-scripts/confluencewiki.vim', #{for: 'confluencewiki'}

" }}} File types

" Integrations {{{

Plug 'antoinemadec/coc-fzf'
Plug 'dense-analysis/ale'
Plug 'janko-m/vim-test', #{for: 'ruby'} " Depends on skywind3000/asyncrun.vim
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc.nvim', #{branch: 'release'}
Plug 'samoshkin/vim-mergetool', #{on: 'MergetoolStart'}
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'skywind3000/asyncrun.vim', #{on: 'AsyncRun'}
Plug 't9md/vim-ruby-xmpfilter', #{for: 'ruby'}
Plug 'tpope/vim-dadbod', #{on: 'DB'}
Plug 'tpope/vim-eunuch' " Unix commands
Plug 'tpope/vim-fugitive', #{tag: 'v*'}
Plug 'tpope/vim-rhubarb'

" }}} Integrations

" Other {{{

Plug 'vimwiki/vimwiki'

" }}} Other

" Performance profiling {{{

" Plug 'tweekmonster/startuptime.vim'

" }}} Performance profiling

call plug#end()

command! PC PlugClean
command! PI PlugInstall
command! PU PlugUpgrade <Bar> PlugUpdate
