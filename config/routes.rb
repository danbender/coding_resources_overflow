CodingResourcesOverflow::Application.routes.draw do
  root to: 'sources#index'
  resources :sources, only: [ :index, :new, :create ]

  put 'sources/:id', to: 'sources#upvote', as: :source
end
