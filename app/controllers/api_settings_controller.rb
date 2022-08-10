class ApiSettingsController < ApplicationController
  layout 'backstage_bare'
  def show
    team = current_user.team
    team.update(api_key: SecureRandom.hex(20)) unless team.api_key
    @facade = OpenStruct.new(
      team: team
    )
  end
end
