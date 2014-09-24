class Spree::SlideImage < ActiveRecord::Base
  self.table_name = "spree_slide_images"

  belongs_to :slide

  # has_attached_file :attachment,
  # :styles => { :landscape => "1920x1080#", :portrait => "960x1080#", :thumb => "100x100>" }
  has_attached_file :attachment,
  :styles => { :thumb => "100x100>", :full => "1920x1080#",
    :portrait => "960x1080#", :portrait_skinny => "640x1080#",
    :landscape => "1920x560#", :landscape_skinny => "1920x360#" }

  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
  validates :attachment, presence: true


end
