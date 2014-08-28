class Spree::Post < ActiveRecord::Base
  before_validation :create_slug, if: :title_changed?

  # attr_accessible :description, :name, :slug

  validates_presence_of :slug


  def to_param
    # "#{published_on}/#{title}"
    # title.parameterize
    "#{published_on.to_f} #{title}".parameterize
  end


  private

  def create_slug
    self.slug =  self.title.parameterize
  end

end
