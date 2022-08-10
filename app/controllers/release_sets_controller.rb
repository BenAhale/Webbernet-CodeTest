class ReleaseSetController < ApplicationController
  def show
    @facade = OpenStruct.new(
      project: Project.find(params[:project_id]),
      releases: Release.where(release_set_id: params[:id])
    )
  end

  def resend
    ReleaseMailer.digest(params[:release_set_id], 'jake@webbernet.com.au').deliver_now
    redirect_back(fallback_location: root_path)
  end
end
