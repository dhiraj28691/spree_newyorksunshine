class AddAttachmentToSurfClubImages < ActiveRecord::Migration

  def self.up
    add_attachment :spree_surf_club_images, :attachment
  end

  def self.down
    remove_attachment :spree_surf_club_images, :attachment
  end

end
