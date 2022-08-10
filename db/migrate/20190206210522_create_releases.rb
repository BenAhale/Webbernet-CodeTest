class CreateReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :releases do |t|
      t.string :title, null: false
      t.integer :status, null: false, default: 0
      t.text :body
      t.integer :released_at
      t.references :release_set
      t.references :project, null: false

      t.timestamps
    end
  end
end
