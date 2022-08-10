class AddPublicFeedToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :public_feed, :boolean, default: false, null: false
  end
end
