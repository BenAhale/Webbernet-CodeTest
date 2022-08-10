class AddReminderToPrompt < ActiveRecord::Migration[5.2]
  def change
    add_reference :prompts, :form_prompt_subscription_reminder, foreign_key: true
  end
end
