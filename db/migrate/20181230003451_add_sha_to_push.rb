class AddShaToPush < ActiveRecord::Migration[5.2]
  def change
    add_column :pushes, :sha, :string, null: false
    add_column :pushes, :branch, :string, null: false
  end
end
