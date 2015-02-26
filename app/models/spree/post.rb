class Spree::Post < ActiveRecord::Base
  before_validation :create_slug, if: :title_changed?

  validates_presence_of :slug, :published_on


  has_many :post_images
  accepts_nested_attributes_for :post_images, :reject_if => :all_blank, :allow_destroy => true

  # def to_param
    # slug
  # end

  default_scope { order('published_on DESC') }

  acts_as_taggable


  has_many :feed_items, :class_name => "Spree::Post"


  private

  def create_slug
    # self.slug = "#{published_on.to_i} #{title}".parameterize
    self.slug = title.parameterize
  end

end
