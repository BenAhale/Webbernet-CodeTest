class FeedsController < SettingsBaseController
  layout 'backstage_bare'
  def show
    project = Project.find(params[:project_id])
    @facade = OpenStruct.new(
      project: project,
      form: FeedSettingsForm.new(project.attributes)
    )
  end

  def update
    FeedSettingsForm.new(params[:feed_settings_form].merge(project_id: params[:project_id])).save
    flash[:success] = 'Feed settings updated'
    redirect_to(fallback_location: root_path)
  end
end
