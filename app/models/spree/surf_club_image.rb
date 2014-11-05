class Spree::SurfClubImage < ActiveRecord::Base

  default_scope { order(:position) }

  has_attached_file :attachment,
  :styles => { :large => "1152x1152>", :extra_large => "1440x1440>" }

  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
  validates :attachment, presence: true

  # validates :surf_club_image, presence: true

end
