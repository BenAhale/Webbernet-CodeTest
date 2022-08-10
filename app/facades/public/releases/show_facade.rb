module Public
  module Releases
    class ShowFacade
      def initialize(params)
        @params = params
      end

      def project
        @project ||= Project.find_by(public_key: @params[:p])
      end

      def release
        @release ||= Release.find_by(project_id: project.id, public_key: @params[:public_id])
      end

      def mark_release_as_read
        return unless @params[:uref].present?
        ReleaseRead.find_or_create_by!(
          release: release,
          uref: UrefLocator.new(
            user_reference: @params[:uref],
            project: release.project
          ).run
        )
      end

      def hide_back_btn
        @params[:hb].present?
      end
    end
  end
end
