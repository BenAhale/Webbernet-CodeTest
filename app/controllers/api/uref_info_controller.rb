module Api
  class UrefInfoController < ApplicationController
    skip_before_action :require_login
    def show
      response = Rails.cache.fetch("uref/v1/#{params[:project_public_key]}/#{params[:id]}", expires_in: 120.seconds) do
        project = Project.find_by(public_key: params[:project_public_key])
        if project
          uref = UrefLocator.new(project: project, user_reference: params[:id]).run
          unread_releases = UnreadReleasesByUref.new(
            uref: uref
          ).unread_release_ids
          { unread: unread_releases.length, html_link: public_releases_url(p: project.public_key, uref: params[:id]) }
        else
          return render json: {error: 'Not Found'} , :status => 404
        end
      end

      expires_in(30.seconds, public: false)
      render json: response
    end
  end
end
