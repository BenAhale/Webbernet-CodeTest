class CreateInternalPromptSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :internal_prompt_subscriptions do |t|
      t.references :prompt_subscription, foreign_key: true, null: false
      t.references :project, foreign_key: true, null: false
      t.references :project_prompt_invitation_token, foreign_key: true, index: { name: 'index_invitation_prompt_project' }, null: false

      t.timestamps
    end
  end
end
