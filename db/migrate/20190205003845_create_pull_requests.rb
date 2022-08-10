class CreatePullRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :pull_requests do |t|
      t.references :project, foreign_key: true
      t.string :sha
      t.string :url

      t.timestamps
    end
  end
end
