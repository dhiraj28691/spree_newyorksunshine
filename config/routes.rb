Spree::Core::Engine.add_routes do

  concern :images do
    resources :images
  end

  namespace :admin do
    resources :lookbooks do
      resources :slides
    end

    resources :posts do
      resources :post_images
    end
  end


  # Add your extension routes here
  # get 'lookbooks', :to => 'lookbooks#index'
  # get 'lookbooks/:id', :to => 'lookbooks#show'

  resources :lookbooks

  get 'news', :to => 'news#index'

  # This needs to change
  # get 'tagged/:tag', :to => 'news#tagged'

  get 'tagged/:tag', to: 'news#index', as: :tag

  get 'stockists', :to => 'stockists#index'

  get 'surfclub', :to => 'surfclub#index'

  get 'about', :to => 'about#index'

  get 'returns-exchanges', :to => 'returnsexchanges#index'

  post 'subscribe' => 'subscribe#process_form'

end
