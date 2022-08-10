class CreateProjectPromptInvitationTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :project_prompt_invitation_tokens do |t|
      t.references :project, index: true, null: false
      t.integer :expiry, null: false
      t.boolean :used, null: false, default: false
      t.string :token, null: false, unique: true

      t.timestamps

    end
    add_index :project_prompt_invitation_tokens, :token, unique: true
  end
end
