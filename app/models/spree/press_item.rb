class Spree::PressItem < ActiveRecord::Base

  default_scope { order('position') }

end
