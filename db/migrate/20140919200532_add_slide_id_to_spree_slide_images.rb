class AddSlideIdToSpreeSlideImages < ActiveRecord::Migration
  def change
    add_reference :spree_slide_images, :slide, index: true
  end
end
