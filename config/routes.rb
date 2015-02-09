Spree::Core::Engine.add_routes do

  concern :images do
    resources :images
  end


  namespace :admin do

    put 'feed_items', to: 'feed_items#update_batch', as: 'update_batch_feed_items'
    resources :feed_items

    put 'surf_club_images', to: 'surf_club_images#update_batch', as: 'update_batch_suf_club_images'
    resources :surf_club_images

    resources :lookbooks, shallow: true do
      resources :slides, shallow: true do
        resources :slide_images
      end
    end

    resources :posts do
      resources :post_images
    end

    put 'stockists/sort', to: 'stockists#sort', as: 'sort_stockists'
    resources :stockists

    resources :contents
    resource :about
    resource :returns_exchanges

    resource :art
    resource :artists_statement
  end


  # Add your extension routes here
  # get 'lookbooks', :to => 'lookbooks#index'
  # get 'lookbooks/:id', :to => 'lookbooks#show'

  resources :lookbooks

  get 'news', to: 'news#index'
  get 'tagged/:tag', to: 'news#index', as: :tag
  get 'post/:id', to: 'news#show', as: :post

  # resources :posts

  # This needs to change
  # get 'tagged/:tag', :to => 'news#tagged'


  get 'stockists', :to => 'stockists#index'

  get 'surfclub', :to => 'surfclub#index'

  get 'about', :to => 'about#index'

  get 'returns-exchanges', :to => 'returns_exchanges#index'

  post 'subscribe' => 'subscribe#process_form'


end
