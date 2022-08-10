module Projects
  class ReleasesFacade
    def initialize(params)
      @params = params
    end

    def project
      @project ||= Project.find_by(public_key: @params[:project_public_id])
    end

    def draft_releases
      @draft_releases ||= project.releases.where(
        status: 'draft',
        release_set_id: nil
      )
    end

    def releases
      @releases ||= project.releases
                     .includes(:category)
                     .includes(:user)
                     .order('status ASC, created_at DESC')
    end
  end
end
