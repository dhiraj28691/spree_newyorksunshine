# This migration comes from spree_newyorksunshine (originally )
class CreateSpreeLookbooks < ActiveRecord::Migration
  def change
    create_table :spree_lookbooks do |t|

      t.timestamps
    end
  end
end