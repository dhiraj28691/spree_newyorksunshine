class CreateSpreeSlides < ActiveRecord::Migration
  def change
    create_table :spree_slides do |t|
      t.text :embed_code
      t.integer :order
      t.references :lookbook, index: true

      t.timestamps
    end
  end
end
