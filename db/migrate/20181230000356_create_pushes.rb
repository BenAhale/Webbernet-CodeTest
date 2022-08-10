class CreatePushes < ActiveRecord::Migration[5.2]
  def change
    create_table :pushes do |t|
      t.references :project, foreign_key: true, null: false
      t.string :message, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
