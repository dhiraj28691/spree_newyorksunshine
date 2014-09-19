class Spree::Slide < ActiveRecord::Base
  belongs_to :lookbook

  has_many :slide_images

end
