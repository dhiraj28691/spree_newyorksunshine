class AddPositionToSpreeStockists < ActiveRecord::Migration
  def change
    add_column :spree_stockists, :position, :integer
  end
end
