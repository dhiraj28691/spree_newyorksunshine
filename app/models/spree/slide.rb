class Spree::Slide < ActiveRecord::Base
  belongs_to :lookbook

  has_many :slide_images

  enum layout: [ "Columns", "Rows", "Donut"]

end
