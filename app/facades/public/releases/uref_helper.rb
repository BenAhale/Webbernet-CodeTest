module Public
  module Releases
    module UrefHelper
      def unread_releases
        return [] unless @params[:uref].present?
        @unread_releaes ||= UnreadReleasesByUref.new(uref: uref).unread_release_ids
      end

      def uref
        UrefLocator.new(project: project, user_reference: @params[:uref]).run
      end

      def mark_releases_as_old
        return unless @params[:uref].present?
        MarkReleasesNotNew.new(uref: uref).run
      end
    end
  end
end
