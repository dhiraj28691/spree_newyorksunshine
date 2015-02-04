class CreateSpreePostImages < ActiveRecord::Migration
  def change
    create_table :spree_post_images do |t|
      t.integer  "position"
      t.timestamps
    end
  end
end