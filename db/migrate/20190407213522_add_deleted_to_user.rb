class AddDeletedToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deleted, :boolean, default: false, null: false
  end
end
