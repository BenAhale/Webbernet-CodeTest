class ApiProjectBaseController < ApiBaseController
  before_action :verify_api_key
  before_action :verify_project_ownership

  def verify_project_ownership
    @current_project = Project.find_by(public_key: params[:project_public_key])
    if @current_project
      return if @current_team == @current_project.team
    end
    render json: { error: 'forbidden' }, status: :forbidden
  end
end
