CodingResourcesOverflow::Application.routes.draw do
  root to: 'sources#index'
  resources :sources, only: [ :index, :new ]
end
