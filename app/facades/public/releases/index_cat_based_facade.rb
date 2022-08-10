module Public
  module Releases
    class IndexCatBasedFacade
      include UrefHelper
      def initialize(params)
        @params = params
      end

      def project
        @project ||= Project.find_by(public_key: @params[:p])
      end

      def releases
        releases = Release.includes(:category, :user).where(project_id: project.id, status: 'published').order('created_at DESC')
        case @params[:r]
        when 'today'
          releases.where('created_at BETWEEN ? AND ?',
                         Tznet::NowLocal.run('Australia/Brisbane').beginning_of_day,
                         Tznet::NowLocal.run('Australia/Brisbane').end_of_day
                        )
        when 'l7'
          releases.where('created_at BETWEEN ? AND ?',
                         (Tznet::NowLocal.run('Australia/Brisbane') - 7.days).beginning_of_day,
                         Tznet::NowLocal.run('Australia/Brisbane').end_of_day
                        )
        when 'l30'
          releases.where('created_at BETWEEN ? AND ?',
                         (Tznet::NowLocal.run('Australia/Brisbane') - 30.days).beginning_of_day,
                         Tznet::NowLocal.run('Australia/Brisbane').end_of_day
                        )
        else
          releases
        end
      end

      def payload
        payload = {}
        releases.each do |release|
          category = release.category.present? ? release.category.title : 'Uncategorised'
          (payload[category] ||= []) << release
        end.uniq
        if payload['Uncategorised']
          payload['Uncategorised'] = payload.delete('Uncategorised')
        end
        payload
      end

      def index_partial_view
        'cat_based_index'
      end
    end
  end
end
