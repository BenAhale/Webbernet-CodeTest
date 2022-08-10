class AddActiveToSubscription < ActiveRecord::Migration[5.2]
  def change
    add_column :email_subscriptions, :active, :boolean, default: true, null: false
  end
end
