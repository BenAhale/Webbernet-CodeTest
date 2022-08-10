module Releases
  class UpdateFacade
    def initialize(params)
      @params = params
    end

    def run
      release.update(
        title:       @params[:release_form][:title],
        body:        @params[:release_form][:body],
        html_body:   @params[:release_form][:html_body],
        category_id: @params[:release_form][:category_id],
        status:      @params[:release_form][:status]
      )
    end

    def release
      Release.find_by(public_key: @params[:public_id])
    end
  end
end
