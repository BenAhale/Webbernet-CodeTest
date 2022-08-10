class AddSenderFieldsToPush < ActiveRecord::Migration[5.2]
  def change
    add_column :pushes, :pusher_username, :string
    add_column :pushes, :pusher_avatar, :string
  end
end
