class CreateReleaseSets < ActiveRecord::Migration[5.2]
  def change
    create_table :release_sets do |t|
      t.references :project, null: false
      t.timestamps
    end
  end
end
