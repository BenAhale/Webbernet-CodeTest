class SummaryBaseController < ApplicationController
  skip_before_action :require_login
  before_action :enable_footer

  def enable_footer
    @show_rr_footer = true
  end
end
