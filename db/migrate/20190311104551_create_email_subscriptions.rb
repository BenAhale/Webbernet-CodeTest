class CreateEmailSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :email_subscriptions do |t|
      t.references :project, foreign_key: true, null: false
      t.string :email, null: false
      t.integer :start_from_release_id
      t.timestamps
    end
  end
end
