class Spree::FeedItem < ActiveRecord::Base

  belongs_to :product
  belongs_to :lookbook
  belongs_to :post

  enum category: [ "Product", "Lookbook", "Post", "Other" ]

  has_attached_file :attachment, :styles => { :cropped => "1080x1620>", :thumb => "100x150#" }
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/

  default_scope { order('position') }

end