class AddLayoutColumnToSpreeSlides < ActiveRecord::Migration
  def change
    add_column :spree_slides, :layout, :integer
  end
end
