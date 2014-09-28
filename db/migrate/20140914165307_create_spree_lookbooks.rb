class AddNameAndSlugAndContentAndAvailableOnAndPublishedToSpreeLookbook < ActiveRecord::Migration
  def change
    # add_column :spree_lookbooks, :name, :string
    # add_column :spree_lookbooks, :slug, :string
    # add_index :spree_lookbooks, :slug, unique: true
    # add_column :spree_lookbooks, :content, :text
    # add_column :spree_lookbooks, :available_on, :datetime
    # add_column :spree_lookbooks, :published, :boolean, default: true

    create_table :spree_lookbooks do |t|
      t.string :name
      t.string :slug, index: true, unique: true
      t.text :content
      t.datetime :available_on
      t.boolean :published, default: true
      t.integer :aspect_ratio

      t.timestamps
    end

  end
end