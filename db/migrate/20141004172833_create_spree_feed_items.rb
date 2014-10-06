class CreateSpreeFeedItems < ActiveRecord::Migration
  def change
    create_table :spree_feed_items do |t|
      t.integer :type
      t.string :href
      t.string :superheading
      t.string :title
      t.integer :position, default: 0, null: false

      t.references :product
      t.references :post

      t.timestamps
    end
  end
end
