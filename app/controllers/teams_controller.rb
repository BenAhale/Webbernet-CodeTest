class TeamsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  layout 'layouts/login_layout'
  def new
    @facade = OpenStruct.new(
      form: RegistrationForm.new
    )
  end

  def create
    @facade = OpenStruct.new(
      form: RegistrationForm.new(params[:registration_form])
    )

    if @facade.form.save
      flash[:success] = 'Account created successfully. Please login'
      redirect_page_js login_path
    end
  end
end
