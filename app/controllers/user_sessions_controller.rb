class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  layout 'layouts/login_layout'

  def new
    redirect_back_or_to(dashboard_path) if logged_in?
  end

  def create
    @user = login(params[:email], params[:password])
    return failed_login unless @user
    return failed_login if @user.deleted
    redirect_back_or_to(dashboard_path)
  end

  def destroy
    logout
    redirect_to login_path, notice: 'Logged out!'
  end

  def failed_login
    @failed_login = true
    render action: 'new'
  end
end
