[Spree::UserPasswordsController,
Spree::UserRegistrationsController,
Spree::UserSessionsController].each do |klass|
  klass.class_eval do
    helper 'spree/products'
  end
end