class Spree::Slide < ActiveRecord::Base
  belongs_to :lookbook

  has_many :slide_images

  accepts_nested_attributes_for :slide_images, allow_destroy: true

  default_scope { order(:order) }


  enum layout: [ "Columns", "Rows", "Donut"]

end
