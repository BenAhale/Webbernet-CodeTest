class AddUserToReleases < ActiveRecord::Migration[5.2]
  def change
    add_reference :releases, :user, foreign_key: true
    Release.unscoped.all.each do |release|
      release.update(user_id: release.project.team.users.first.id)
    end
    change_column_null :releases, :user_id, false
  end
end
