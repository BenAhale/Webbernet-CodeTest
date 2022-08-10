require 'rails_helper'

describe 'auth api' do
  let(:team)       { create(:team, api_key: 123) }
  let!(:project)   { create(:project, team: team) }

  let(:team_2)     { create(:team, api_key: 321) }
  let!(:project_2) { create(:project, team: team_2) }

  it '' do
    get api_project_releases_path(project_public_key: project.public_key), headers: team_auth_headers(team)
            expect(JSON.parse(response.body)).to eq([])
  end

  context "when team doesn't have an API key" do
    before do
      team.update(api_key: nil)
    end
    it 'throws unauth' do
      get api_project_releases_path(project_public_key: project.public_key)
      expect(JSON.parse(response.body)).to eq({ "error" => 'unauthorized' })
    end
  end

  context "when not authenticated" do
    it 'throws unauth' do
      get api_project_releases_path(project_public_key: project.public_key)
      expect(JSON.parse(response.body)).to eq({ "error" => 'unauthorized' })
    end
  end

  context "when not authorised for project" do
    it 'throws forbidden' do
      get api_project_releases_path(project_public_key: project.public_key),
          headers: { 'x-api-key' => project_2.team.api_key }
      expect(JSON.parse(response.body)).to eq({ "error" => 'forbidden' })
    end
  end
end
