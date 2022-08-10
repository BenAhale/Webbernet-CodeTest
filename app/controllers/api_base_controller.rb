class ApiBaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_api_key

  rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
    error = {}
    error[parameter_missing_exception.param] = ['parameter is required']
    response = { errors: [error] }
    render json: response, status: :unprocessable_entity
  end

  def verify_api_key
    api_key = request.headers['x-api-key']

    if api_key.present?
      @current_team = Team.find_by(api_key: api_key)
      return if @current_team
    end

    render json: { error: 'unauthorized' }, status: :unauthorized
  end
end
