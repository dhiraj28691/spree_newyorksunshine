class Spree::Stockist < ActiveRecord::Base

  enum region: [ "North America", "International" ]


end
