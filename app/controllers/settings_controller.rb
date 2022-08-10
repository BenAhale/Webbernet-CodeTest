class SettingsController < SettingsBaseController
  layout 'backstage_bare'
  def edit
    @facade = Settings::EditFacade.new(params)
  end

  def update
    SettingsForm.new(
      params[:settings_form]
        .permit(:title, :emails, :public_feed, :hide_author, :visibility)
        .merge({pid: params[:project_public_id]})
    ).save

    flash[:success] = 'Details Saved Successfully'
    redirect_page_js edit_project_settings_path
  end
end
