class AddIndexToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_index :email_subscriptions, :next_run
  end
end
