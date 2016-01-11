class CreateSpreePressItems < ActiveRecord::Migration
  def change
    create_table :spree_press_items do |t|
      t.string :name
      t.string :link
      t.integer :position
      t.attachment :logo
    end
    add_index :spree_press_items, :position
  end
end
