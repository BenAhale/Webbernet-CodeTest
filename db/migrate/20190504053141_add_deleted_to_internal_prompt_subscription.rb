class AddDeletedToInternalPromptSubscription < ActiveRecord::Migration[5.2]
  def change
    add_column :prompt_subscriptions, :deleted, :boolean, null: false, default: false
  end
end
