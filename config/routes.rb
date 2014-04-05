Spree::Core::Engine.routes.draw do
  namespace :spree do
    resources :lookbooks
  end

  # Add your extension routes here
  get 'lookbook', :to => 'lookbooks#index'



end
