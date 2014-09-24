class RemoveSpreeSlideIdFromSpreeSlideImages < ActiveRecord::Migration
  def change
    remove_column :spree_slide_images, :spree_slide_id, :integer
  end
end
