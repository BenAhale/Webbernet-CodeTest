module Public
  module Releases
    class IndexKnowledgeBasedFacade
      include UrefHelper
      def initialize(params)
        @params = params
      end

      def project
        @project ||= Project.find_by(public_key: @params[:p])
      end

      def releases
        Release.includes(:category, :user).where(project_id: project.id, status: 'published').order('created_at DESC')
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
        'knowledge_based_index'
      end
    end
  end
end
