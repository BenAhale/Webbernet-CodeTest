class CreatePublicReleaseForms < ActiveRecord::Migration[5.2]
  def change
    create_table :form_prompt_subscriptions, id: :uuid do |t|
      t.string :title, null: false
      t.references :prompt_subscription, foreign_key: true, null: false

      t.timestamps
    end
  end
end
