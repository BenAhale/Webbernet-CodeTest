class CreateReleaseReads < ActiveRecord::Migration[5.2]
  def change
    create_table :release_reads do |t|
      t.references :release, foreign_key: true, null: false
      t.references :uref, foreign_key: true, null: false

      t.timestamps
    end
  end
end
