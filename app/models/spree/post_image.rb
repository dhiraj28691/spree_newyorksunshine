class Spree::PostImage < ActiveRecord::Base
  # self.table_name = "spree_post_images"

  acts_as_list scope: :post
  belongs_to :post
  default_scope { order(:position) }

  has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
  validates :attachment, presence: true


end


