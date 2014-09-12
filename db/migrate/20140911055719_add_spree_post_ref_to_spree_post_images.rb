class AddSpreePostRefToSpreePostImages < ActiveRecord::Migration
  def change
    add_reference :spree_post_images, :post, index: true
  end
end
