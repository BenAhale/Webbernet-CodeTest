class CreateSummaryReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :summary_releases do |t|
      t.references :summary, foreign_key: true, null: false, type: :uuid
      t.references :release, foreign_key: true, null: false

      t.timestamps
    end
  end
end
