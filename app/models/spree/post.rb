class Spree::Post < ActiveRecord::Base
  before_validation :create_slug, if: :title_changed?

  # attr_accessible :description, :name, :slug

  validates_presence_of :slug

  has_many :post_images
  accepts_nested_attributes_for :post_images, :reject_if => :all_blank, :allow_destroy => true

  # def to_param
    # slug
  # end


  private

  def create_slug
    # self.slug = "#{published_on.to_i} #{title}".parameterize
    self.slug = title.parameterize
  end

end
