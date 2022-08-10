class UsersController < ApplicationController
  layout 'backstage_bare'
  def index
    @facade = OpenStruct.new(
      users: @current_user.team.users.where(deleted: false).order(:last_name),
      team: current_user.team
    )
  end

  def create
    user = UserForm.new(params[:user_form].merge(team_id: @current_user.team.id)).save
    UserMailer.new_user_email(user).deliver_now
    redirect_back(fallback_location: root_path)
  end

  def new
    @facade = OpenStruct.new(
      form: UserForm.new
    )
  end

  def destroy
    team = current_user.team
    user = team.users.find(params[:id])
    if user.super_user
      flash[:error] = 'You cannot delete super users!'
    else
      flash[:success] = 'User deleted successfully'
      ProjectUser.transaction do
        ProjectUser.where(user: user).destroy_all
        user.update(deleted: true)
      end
    end
    redirect_back(fallback_location: root_path)
  end
end
