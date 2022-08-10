class ProjectUsersController < ProjectsBaseController
  layout 'backstage_bare'
  def index
    @facade = ProjectUsers::IndexFacade.new(params)
  end

  def create
    ProjectUser.create(project: @current_project, user_id: params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    ProjectUser.find_by(user_id: params[:id], project: @current_project).destroy
    redirect_back(fallback_location: root_path)
  end
end
