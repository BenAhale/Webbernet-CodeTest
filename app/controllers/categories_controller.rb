class CategoriesController < SettingsBaseController
  layout 'backstage_bare'
  def index
    @facade ||= Categories::IndexFacade.new(params)
  end

  def new
    @facade = OpenStruct.new(form: CategoriesForm.new)
  end

  def create
    CategoriesForm.new(params[:categories_form].merge({pid: params[:project_public_id]})).save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @facade ||= Categories::DestroyFacade.new(params).run
    redirect_back(fallback_location: root_path)
  end
end
