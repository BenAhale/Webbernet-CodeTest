module Api
  class ReleasesController < ApiProjectBaseController
    skip_before_action :require_login
    def index
      project = Project.find_by(public_key: params[:project_public_key])

      releases = Release.includes(:category).where(project: project)

      if params[:status].present?
        releases = releases.where(status: params[:status])
      end

      if params[:search].present?
        releases = releases.where('title LIKE ?', '%' + params[:search] + '%')
      end

      response = releases.map do |release|
        category = if release.category
                     {
                       id: release.category.public_key,
                       title: release.category.title
                     }
                   else
                     {}
                   end

        url_parameters = { public_id: release.public_key, p: project.public_key }
        if params[:uref].present?
          url_parameters.merge!({uref: params[:uref]})
        end

        {
          id: release.public_key,
          title: release.title,
          status: release.status,
          category: category,
          html_link: public_release_url(url_parameters)
        }
      end

      render json: response
    end
  end
end
