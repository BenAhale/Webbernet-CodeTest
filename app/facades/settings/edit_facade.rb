module Settings
  class EditFacade
    def initialize(params)
      @params = params
    end

    def project
      @project ||= Project.find_by(public_key: @params[:project_public_id])
    end

    def form
      @form ||= SettingsForm.new(project.attributes)
    end

    def subscribed
      @subscribed ||= SubscribedProjects.new(project).run
    end
  end
end
