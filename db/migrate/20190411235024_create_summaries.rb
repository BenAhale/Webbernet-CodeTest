class CreateSummaries < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto'
    create_table :summaries, id: :uuid do |t|
      t.references :email_subscription, foreign_key: true, null: false
      t.timestamps
    end
  end
end
