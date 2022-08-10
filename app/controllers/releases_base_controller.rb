class ReleasesBaseController < ProjectsBaseController
  before_action :verify_release_ownership

  def verify_release_ownership
    redirect_to root_path unless @current_user.team == Release.find_by(public_key: params[:public_id]).project.team
  end
end
