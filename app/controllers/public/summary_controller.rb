module Public
  class SummaryController < SummaryBaseController
    layout 'frontstage'

    def show
      summary = Summary.find(params[:id])
      @facade = OpenStruct.new(
        releases: summary.releases.includes(:user).where(status: :published),
        project: summary.releases.first.project
      )
    end
  end
end
