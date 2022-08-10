module Public
  module Releases
    class IndexFullFeedFacade
      include UrefHelper
      def initialize(params)
        @params = params
      end

      def project
        @project ||= Project.find_by(public_key: @params[:p])
      end

      def releases
        @releases ||= Release.includes(:category, :user)
                        .where(project_id: project.id, status: 'published').order('created_at DESC')
                        .paginate(page: @params[:page], per_page: 5)
      end

      def mark_releases_as_read
        return unless @params[:uref].present?
        releases.each do |release|
          ReleaseRead.find_or_create_by!(
            release: release,
            uref: UrefLocator.new(user_reference: @params[:uref], project: release.project).run
          )
        end
      end

      def index_partial_view
        'full_feed_index'
      end
    end
  end
end
