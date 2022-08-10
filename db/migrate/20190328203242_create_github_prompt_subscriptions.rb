class CreateGithubPromptSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :github_prompt_subscriptions do |t|
      t.references :prompt_subscription, foreign_key: true, null: false
      t.string :branch, null: false
      t.string :hook_url_token, null: false

      t.timestamps
    end
  end
end
