autocmd FileType ruby,eruby let g:rubycomplete_rails = 0

let g:rails_projections = {
      \ 'app/uploaders/*_uploader.rb': {
      \   'type': 'uploader',
      \   'template':
      \     ['class {camelcase|capitalize|colons}Uploader < '
      \      . 'CarrierWave::Uploader::Base', 'end'],
      \   'test': [
      \     'test/unit/{}_uploader_test.rb',
      \     'spec/models/{}_uploader_spec.rb'
      \   ],
      \   'keywords': 'process version'
      \ },
      \ 'features/support/*.rb': {'type': 'support'},
      \ 'features/support/env.rb': {'type': 'support'},
      \ 'app/*.rb': {
      \   'alternate': 'spec/{}_spec.rb',
      \   'test': 'spec/{}_spec.rb'
      \ },
      \ 'spec/*_spec.rb': {
      \   'alternate': 'app/{}.rb',
      \ },
      \ 'app/interactors/*.rb': {
      \   'type': 'interactor'
      \ }}
