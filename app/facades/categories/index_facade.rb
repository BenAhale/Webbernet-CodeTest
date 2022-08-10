module Categories
  class IndexFacade
    def initialize(params)
      @params = params
    end

    def project
      @project ||= Project.find_by(public_key: @params[:project_public_id])
    end

    def categories
      project.categories
    end

    def form
      CategoriesForm.new
    end
  end
end
