class AddAspectRatioToSpreeLookbook < ActiveRecord::Migration
  def change
    add_column :spree_lookbooks, :aspect_ratio, :integer
  end
end
