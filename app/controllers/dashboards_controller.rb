class DashboardsController < ApplicationController
  layout 'backstage_bare'
  def show
    projects = ProjectsForUser.new(current_user).run
    @facade = OpenStruct.new(
      projects: projects,
      team: current_user.team
    )
  end
end
