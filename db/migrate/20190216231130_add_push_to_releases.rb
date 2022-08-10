class AddPushToReleases < ActiveRecord::Migration[5.2]
  def change
    add_reference :releases, :push, foreign_key: true
  end
end
