class CreatePromptSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prompt_subscriptions do |t|
      t.references :project, foreign_key: true, null: false
      t.integer :kind, null: false

      t.timestamps
    end
  end
end
