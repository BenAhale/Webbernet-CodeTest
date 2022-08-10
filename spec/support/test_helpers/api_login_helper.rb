module Support
  module TestHelpers
    module ApiLoginHelper
      def team_auth_headers(team)
        team.update(api_key: 123) unless team.api_key
        { 'x-api-key' => project.team.api_key }
      end
    end
  end
end
