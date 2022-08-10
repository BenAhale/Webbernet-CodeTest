module Releases
  class DestroyFacade
    def initialize(params)
      @params = params
    end

    def run
      project.releases.find_by(public_key: @params[:public_id]).update(active: false)
    end

    def project
      @project ||= Project.find_by(public_key: @params[:project_public_id])
    end
  end
end
