class CreateSpreeSlideImages < ActiveRecord::Migration
  def change
    create_table :spree_slide_images do |t|
      t.integer :order
      t.references :spree_slide, index: true

      t.timestamps
    end
  end
end
