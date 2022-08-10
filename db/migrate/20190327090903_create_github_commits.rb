class CreateGithubCommits < ActiveRecord::Migration[5.2]
  def change
    create_table :commits do |t|
      t.string :sha, null: false
      t.string :branch, null: false
      t.string :pusher_username
      t.string :pusher_avatar
      t.string :link
      t.references :prompt, foreign_key: true, null: false

      t.timestamps
    end
  end
end
