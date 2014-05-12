Spree::Core::Engine.routes.draw do
  namespace :spree do
    # resources :lookbooks
    # resources :stockists
  end

  # Add your extension routes here
  get 'lookbook', :to => 'lookbooks#index'

  get 'news', :to => 'news#index'

  # This needs to change
  get 'tagged/:tag', :to => 'news#tagged'

  get 'stockists', :to => 'stockists#index'

  get 'surfclub', :to => 'surfclub#index'

  get 'about', :to => 'about#index'

  get 'returns-exchanges', :to => 'returnsexchanges#index'

  post 'subscribe' => 'subscribe#process_form'

end
