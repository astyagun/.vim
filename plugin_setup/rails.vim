autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

let g:rails_projections = {
      \ "app/uploaders/*_uploader.rb": {
      \   "type": "uploader",
      \   "template":
      \     ["class {camelcase|capitalize|colons}Uploader < "
      \      . "CarrierWave::Uploader::Base", "end"],
      \   "test": [
      \     "test/unit/{}_uploader_test.rb",
      \     "spec/models/{}_uploader_spec.rb"
      \   ],
      \   "keywords": "process version"
      \ },
      \ "features/support/*.rb": {"type": "support"},
      \ "features/support/env.rb": {"type": "support"},
      \ "app/models/*.rb": {
      \   "type": "model",
      \   "alternate": "spec/models/{}_spec.rb",
      \   "test": "spec/models/{}_spec.rb"
      \ },
      \ "spec/models/*_spec.rb": {
      \   "type": "modelspec",
      \   "alternate": "app/models/{}.rb",
      \   "test": "app/models/{}.rb"
      \ }}
