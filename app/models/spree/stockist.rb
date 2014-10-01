class Spree::Stockist < ActiveRecord::Base

  enum region: [ "North America", "International" ]

  default_scope { order('region, position') }


end
