class ProjectsBaseController < ApplicationController
  before_action :verify_project_ownership

  def verify_project_ownership
    public_token = params[:project_public_id] || params[:public_id]
    @current_project = Project.find_by(public_key: public_token)
    has_permission = UserPermissionToProject.new(@current_project, @current_user).run
    access_denied unless has_permission
  end

  def access_denied
    flash[:error] = 'Sorry, you don\'t have access'
    redirect_to root_path
  end
end
