class Spree::PostImage < ActiveRecord::Base
  # self.table_name = "spree_post_images"
  acts_as_list scope: :post
  belongs_to :post
  default_scope { order(:position) }

  has_attached_file :attachment,
  :styles => { :large => "992x992>", :thumb => "336x189>", :cropped => "1080x1620#" },
  :convert_options => { :all => '-colorspace Gray' },
  :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
  validates :attachment, presence: true

  # after_save :convert_grayscale

  # def convert_grayscale
  #   system "convert public/system/avatars/#{self.id}/thumb/#{self.attachment.original_filename} -fx '(r+g+b)/3' public/system/avatars/#{self.id}/grayscale/#{self.attachment.original_filename}"
  # end
end