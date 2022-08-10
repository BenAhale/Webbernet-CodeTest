class CreatePrompts < ActiveRecord::Migration[5.2]
  def change
    create_table :prompts do |t|
      t.references :project
      t.text :body
      t.text :title, null: false
      t.integer :kind, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
