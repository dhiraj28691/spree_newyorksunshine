class CreateWorks < ActiveRecord::Migration
  def change
    create_table :spree_works do |t|
      t.integer :position
      t.text :caption
      t.boolean :published

      t.timestamps
    end
  end
end
