class AddNameAndSlugAndContentAndAvailableOnAndPublishedToSpreeLookbook < ActiveRecord::Migration
  def change
    add_column :spree_lookbooks, :name, :string
    add_column :spree_lookbooks, :slug, :string
    add_index :spree_lookbooks, :slug, unique: true
    add_column :spree_lookbooks, :content, :text
    add_column :spree_lookbooks, :available_on, :datetime
    add_column :spree_lookbooks, :published, :boolean, default: true
  end
end
