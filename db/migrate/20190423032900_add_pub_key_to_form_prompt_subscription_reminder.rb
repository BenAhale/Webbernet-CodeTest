class AddPubKeyToFormPromptSubscriptionReminder < ActiveRecord::Migration[5.2]
  def change
    add_column :form_prompt_subscription_reminders, :public_key, :string, null: false
    add_index :form_prompt_subscription_reminders, :public_key, unique: true
  end
end
