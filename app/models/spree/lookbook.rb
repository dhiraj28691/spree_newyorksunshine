class Spree::Lookbook < ActiveRecord::Base


  has_many :slides

  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope { order('available_on DESC') }

  scope :published, where(:published => true)

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

end
