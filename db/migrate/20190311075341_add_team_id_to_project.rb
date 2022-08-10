class AddTeamIdToProject < ActiveRecord::Migration[5.2]
  def change
    team = Team.create!
    add_reference :projects, :team, foreign_key: true
    Project.all.update_all(team_id: team.id)
  end
end
