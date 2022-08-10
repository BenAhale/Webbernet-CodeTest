module Releases
  class NewFacade
    def initialize(params)
      @params = params
    end

    def form
      ReleaseForm.new
    end

    def prompt
      PromptSubscriptionPartialDirectory.new(
        project.prompts.find_by(id: @params[:pid])
      )
    end

    def categories
      project.categories
    end

    def project
      @project ||= Project.find_by(public_key: @params[:project_public_id])
    end
  end
end
