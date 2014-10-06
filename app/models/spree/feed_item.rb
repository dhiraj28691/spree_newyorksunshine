class Spree::FeedItem < ActiveRecord::Base

  belongs_to :product

  enum type: [ "Product", "Post", "Custom" ]

  has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  # validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/

end
