module Public
  module Releases
    class IndexFullDetailFacade
      include UrefHelper
      def initialize(params)
        @params = params
      end

      def project
        @project ||= Project.find_by(public_key: @params[:p])
      end

      def releases
        Release.where(project_id: project.id, status: 'published').order('created_at DESC')
      end

      def payload
        payload = {}
        releases.each do |release|
          friendly_date = Tznet::Format.run('au_long_date', release.created_at.in_time_zone('Australia/Brisbane'))
          (payload[friendly_date] ||= []) << release
        end.uniq
        payload
      end

      def index_partial_view
        'time_based_index'
      end
    end
  end
end
