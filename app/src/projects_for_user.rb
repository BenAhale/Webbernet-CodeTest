# Lists out all the projects that a user
# has access to based on
# * being on the same team
# * being a superuser
# * being in the approved users list for a project
class ProjectsForUser
  def initialize(user)
    @user = user
  end

  def run
    return [] if @user.deleted
    projects.map do |project|
      next unless user_on_project?(project)
      project
    end.compact.sort_by(&:title)
  end

  private

  def projects
    @user.team.projects.active.includes(:project_users)
  end

  def user_on_project?(project)
    users = project.project_users
    return true if users.empty?
    return true if @user.super_user
    users.map(&:user_id).include? @user.id
  end
end
