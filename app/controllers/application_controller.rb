class ApplicationController < ActionController::Base
  before_action :require_login
  around_action :set_time_zone, if: :current_user
  add_flash_types :success, :info, :warning, :error

  def redirect_page_js(path)
    render js: "window.location='#{path}'"
  end

  def refresh_page_js
    render js: "window.location.reload();"
  end

  private

  def set_time_zone(&block)
    # Time.use_zone(current_user.time_zone, &block)
    Time.use_zone('Australia/Brisbane', &block)
  end
end
