class Spree::Lookbook < ActiveRecord::Base

  validates :available_on, presence: true
  validates :aspect_ratio, presence: true

  has_many :slides

  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope { order('available_on DESC') }

  scope :published, -> { where(published: true).where("available_on <= ?", DateTime.now) }

  enum aspect_ratio: [ "1:1", "4:3", "3:2", "16:9", "21:9" ]

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

end
