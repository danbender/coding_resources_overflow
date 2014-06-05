CodingResourcesOverflow::Application.routes.draw do
  root to: 'sources#index'

  resources :sources do
    resources :comments, only: [ :index, :create ]
  end

  get 'tags/:tag', to: 'sources#index', as: :tag

  put 'sources/:id/upvote', to: 'sources#upvote', as: :upvote_source
end
