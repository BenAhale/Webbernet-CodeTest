module Releases
  class CreateFacade
    def initialize(params, current_user)
      @params = params
      @current_user = current_user
    end

    def form
      ReleaseForm.new(attributes)
    end

    def project
      @project ||= Project.find_by(public_key: @params[:project_public_id])
    end

    private

    def attributes
      @params[:release_form].merge(
        project_id: project.id, user_id: @current_user.id
      )
    end
  end
end
