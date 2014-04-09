Spree::Core::Engine.routes.draw do
  namespace :spree do
    # resources :lookbooks
    # resources :stockists
  end

  # Add your extension routes here
  get 'lookbook', :to => 'lookbooks#index'

  get 'stockists', :to => 'stockists#index'

  get 'surfclub', :to => 'surfclub#index'

end
