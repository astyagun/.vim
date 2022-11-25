let g:projectionist_heuristics = {
      \   "Gemfile|package.yml": {
      \     "app/*.rb": {
      \       "alternate": [
      \         "spec/{}_spec.rb",
      \         "spec/{}_call_spec.rb"
      \       ]
      \     },
      \     "app/controllers/*_controller.rb": {"type": "controller", "alternate": "spec/requests/{}_spec.rb"},
      \     "Gemfile": {"alternate": "Gemfile.lock"},
      \     "Gemfile.lock": {"alternate": "Gemfile"},
      \     "lib/*.rb": {
      \       "alternate": [
      \         "spec/{}_spec.rb",
      \         "spec/{}_call_spec.rb",
      \         "spec/lib/{}_spec.rb",
      \         "spec/lib/{}_call_spec.rb"
      \       ]
      \     },
      \     "spec/*_spec.rb": {
      \       "alternate": [
      \         "app/{}.rb",
      \         "lib/{}.rb"
      \       ]
      \     },
      \     "spec/*_call_spec.rb": {
      \       "alternate": [
      \         "app/{}.rb",
      \         "lib/{}.rb"
      \       ]
      \     },
      \     "spec/lib/*_spec.rb": {"alternate": "lib/{}.rb"},
      \     "spec/lib/*_call_spec.rb": {"alternate": "lib/{}.rb"},
      \     "spec/requests/*_spec.rb": {"type": "requestspec", "alternate": "app/controllers/{}_controller.rb"},
      \   }
      \ }
