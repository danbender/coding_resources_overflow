CodingResourcesOverflow::Application.routes.draw do
  root to: 'sources#index'
  resources :sources

  put 'sources/:id', to: 'sources#upvote', as: :upvote_source
end
