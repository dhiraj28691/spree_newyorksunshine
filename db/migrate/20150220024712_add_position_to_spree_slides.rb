class AddPositionToSpreeSlides < ActiveRecord::Migration
  def change
    add_column :spree_slides, :position, :integer
  end
end
