class AddAttachmentAttachmentToSpreeFeedItems < ActiveRecord::Migration
  def self.up
    change_table :spree_feed_items do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :spree_feed_items, :attachment
  end
end
