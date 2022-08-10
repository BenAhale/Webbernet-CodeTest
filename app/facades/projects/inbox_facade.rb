module Projects
  class InboxFacade
    def initialize(params)
      @params = params
    end

    def project
      @project ||= Project.find_by(public_key: @params[:project_public_id])
    end

    def prompts
      @prompts ||= project.prompts.where(
        status: 'pending'
      ).order(:created_at)
    end
  end
end
