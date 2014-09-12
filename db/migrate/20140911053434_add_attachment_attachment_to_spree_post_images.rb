class AddAttachmentAttachmentToSpreePostImages < ActiveRecord::Migration
  def self.up
    change_table :spree_post_images do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :spree_post_images, :attachment
  end
end
