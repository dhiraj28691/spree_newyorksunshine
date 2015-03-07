class Spree::SlideImage < ActiveRecord::Base
  self.table_name = "spree_slide_images"

  belongs_to :slide

  # has_attached_file :attachment,
  # :styles => { :landscape => "1920x1080#", :portrait => "960x1080#", :thumb => "100x100>" }
  has_attached_file :attachment,
  :styles => { :full => "2560x1440>", :thumb => "336x189>" }

  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
  validates :attachment, presence: true

  default_scope { order(:position) }


end
