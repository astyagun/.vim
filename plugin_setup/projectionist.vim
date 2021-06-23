let g:projectionist_heuristics = {
      \   "Gemfile": {
      \     "app/*.rb": {"alternate": "spec/{}_spec.rb"},
      \     "lib/*.rb": {
      \       "alternate": [
      \         "spec/{}_spec.rb",
      \         "spec/lib/{}_spec.rb"
      \       ]
      \     },
      \     "spec/*_spec.rb": {
      \       "alternate": [
      \         "app/{}.rb",
      \         "lib/{}.rb"
      \       ]
      \     },
      \     "spec/lib/*_spec.rb": {"alternate": "lib/{}.rb"}
      \   }
      \ }
