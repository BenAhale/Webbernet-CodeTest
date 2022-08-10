module Categories
  class DestroyFacade
    def initialize(params)
      @params = params
    end

    def run
      Category.transaction do
        Release
          .unscoped
          .where(category_id: category.id)
          .update_all(category_id: nil)
        category.destroy
      end
    end

    private

    def project
      @project ||= Project.find_by(public_key: @params[:project_public_id])
    end

    def category
      Category.find_by(id: @params[:id], project: project)
    end
  end
end
