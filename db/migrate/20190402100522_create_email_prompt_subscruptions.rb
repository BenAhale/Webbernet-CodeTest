class CreateEmailPromptSubscruptions < ActiveRecord::Migration[5.2]
  def change
    create_table :email_prompt_subscriptions do |t|
      t.references :prompt_subscription, null: false
      t.string :email_prefix_token, null: false
      t.timestamps
    end

    add_index :email_prompt_subscriptions, :email_prefix_token, unique: true
  end
end
