class Spree::FeedItem < ActiveRecord::Base
  before_save :destroy_image?

  belongs_to :product, :dependent => :destroy
  belongs_to :lookbook
  belongs_to :post

  enum category: [ "Product", "Lookbook", "Post", "Other" ]

  # has_attached_file :attachment, :styles => { :cropped => "1080x1620>", :thumb => "100x150#" }
  has_attached_file :attachment, :styles => { :cropped => "856x1248>", :thumb => "100x150#" }

  attr_accessor :delete_attachment
  before_validation { attachment.clear if delete_attachment == '1' }


  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/

  default_scope { order('position') }


  private

  def destroy_image?
    self.image.clear if @image_delete == "1"
  end

end