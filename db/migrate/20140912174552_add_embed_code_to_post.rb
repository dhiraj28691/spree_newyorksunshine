class AddEmbedCodeToPost < ActiveRecord::Migration
  def change
    add_column :spree_posts, :embed_code, :text
  end
end
