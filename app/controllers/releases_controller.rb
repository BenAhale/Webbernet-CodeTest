class ReleasesController < ReleasesBaseController

  layout 'backstage_bare'
  skip_before_action :verify_release_ownership, only: [:new, :create]

  def new
    @facade = Releases::NewFacade.new(params)
  end

  def create
    Release.transaction do
      @facade = Releases::CreateFacade.new(params, current_user)
      return unless @facade.form.save
      flash[:success] = 'Release created'

      if params[:release_form][:prompt_id].present?
        if params[:commit] == 'create'
          Prompts::DiscardFacade.new(
            {
              prompt_id: params[:release_form][:prompt_id],
              project_public_id: params[:project_public_id]
            }
          ).run
          return redirect_to project_inbox_path
        end
      end

      if params[:release_form][:prompt_id].present?
        return redirect_back(fallback_location: root_path)
      end
      redirect_to project_releases_path
    end
  end

  def edit
    @facade = Releases::EditFacade.new(params)
  end

  def update
    Releases::UpdateFacade.new(params).run
    flash[:success] = 'Release updated successfully'
    redirect_to project_releases_path
  end

  def destroy
    Releases::DestroyFacade.new(params).run
    flash[:success] = 'Deleted Successfully'
    return redirect_back(fallback_location: root_path) if params[:refresh]
    redirect_to project_releases_path
  end
end
