class CreateEmailPromptDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :email_prompt_details do |t|
      t.references :prompt, foreign_key: true, null: false
      t.string :to, null: false
      t.string :from, null: false

      t.timestamps
    end
  end
end
