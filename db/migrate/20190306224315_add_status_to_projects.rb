class AddStatusToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :active, :boolean, null: false, default: true
  end
end
