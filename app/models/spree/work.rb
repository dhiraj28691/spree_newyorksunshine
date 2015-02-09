class Spree::Work < ActiveRecord::Base

  default_scope { order('position') }

  has_attached_file :attachment,
  :styles => { :large => "992x992>" },
  :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
  validates :attachment, presence: true


end
