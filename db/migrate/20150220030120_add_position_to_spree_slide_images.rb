class AddPositionToSpreeSlideImages < ActiveRecord::Migration
  def change
    add_column :spree_slide_images, :position, :integer
  end
end
