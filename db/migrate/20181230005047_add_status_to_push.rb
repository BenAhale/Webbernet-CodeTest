class AddStatusToPush < ActiveRecord::Migration[5.2]
  def change
    add_column :pushes, :status, :integer, null: false, default: 0
    add_column :pushes, :release_title, :string
    add_column :pushes, :release_body, :text
  end
end
