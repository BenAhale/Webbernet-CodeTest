class AddReleasedAtToPush < ActiveRecord::Migration[5.2]
  def change
    add_column :pushes, :released_at, :integer
  end
end
