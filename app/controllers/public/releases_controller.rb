module Public
  class ReleasesController < FeedBaseController
    layout 'frontstage'

    def index
      if params['ft'] == 'cb'
        @facade = Public::Releases::IndexCatBasedFacade.new(params)
        @facade.unread_releases
        @facade.mark_releases_as_old
        return
      end

      if params['ft'] == 'kb'
        @facade = Public::Releases::IndexKnowledgeBasedFacade.new(params)
        @facade.unread_releases
        @facade.mark_releases_as_old
        return
      end

      if params['ft'] == 'fd'
        @facade = Public::Releases::IndexKnowledgeBasedFacade.new(params)
        @facade.unread_releases
        @facade.mark_releases_as_old
        return
      end

      if params['ft'] == 'tb'
        @facade = Public::Releases::IndexFacade.new(params)
        @facade.unread_releases
        @facade.mark_releases_as_old
        return
      end

      @facade = Public::Releases::IndexFullFeedFacade.new(params)
      @infinite_scroll = true
      @facade.unread_releases
      @facade.mark_releases_as_old
      @facade.mark_releases_as_read
    end

    def show
      @facade = Public::Releases::ShowFacade.new(params)
      @facade.mark_release_as_read
    end
  end
end
