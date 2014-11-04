class CreateSpreeSurfClubImages < ActiveRecord::Migration
  def change
    create_table :spree_surf_club_images do |t|
      t.integer :position, default: -1

      t.timestamps
    end
  end
end
