class CreateSpreePress < ActiveRecord::Migration
  def change
    create_table :spree_presses do |t|
      t.string :name
      t.string :link
      t.integer :position
      t.attachment :logo
    end
    add_index :spree_presses, :position
  end
end
