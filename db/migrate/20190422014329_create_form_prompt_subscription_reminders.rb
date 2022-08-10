class CreateFormPromptSubscriptionReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :form_prompt_subscription_reminders do |t|
      t.references :form_prompt_subscription, foreign_key: true, type: :uuid, index: { name: 'form_sub_reminders' }
      t.string :email, null: false

      t.timestamps
    end
  end
end
