module Public
  class ErrorsController < FeedBaseController
    skip_before_action :check_public_feed
    layout 'frontstage'
    def show
      @message = case params[:et]
                 when 'RR004'
                   'Project not found'
                 when 'RR003'
                   'Sorry - This is a private feed and you don\'t have access.'
                 when 'RR002'
                   'Sorry - This link has expired'
                 when 'RR001'
                   'Sorry - The signature is malformed'
                 end
    end
  end
end
