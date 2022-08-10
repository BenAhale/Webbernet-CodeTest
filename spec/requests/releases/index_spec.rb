require 'rails_helper'

describe 'releases' do
  let!(:project)   { create(:project, :with_team) }

  context "when there are releases" do
    let(:category) { create(:category, :with_project, title: 'Updates') }

    let!(:release) do
      create(:release, :with_user, title: 'Red Duck', project: project, category: category, status: 'published')
    end

    let!(:draft_release) do
      create(:release, :with_user, title: 'Blue Dog', project: project, status: 'draft')
    end

    let!(:release_other_project) { create(:release, :with_user, :with_project, status: 'published') }

    context "with no status param" do
      context "when NOT using a search param" do
        it 'lists all the releases for the particular project' do
          call_get
          expect(parsed_response).to eq(
                                       [
                                         { id: release.public_key,
                                           title: release.title,
                                           status: release.status,
                                           category: { id: category.public_key, title: category.title },
                                           html_link:  public_release_url(public_id: release.public_key,p: project.public_key)
                                         }.as_json,
                                         { id: draft_release.public_key,
                                           title: draft_release.title,
                                           status: draft_release.status,
                                           category: { },
                                           html_link: public_release_url(public_id: draft_release.public_key,p: project.public_key)
                                         }.as_json
                                       ]
                                     )
          expect(parsed_response.length).to eq(2)
        end
      end

      context "when using a search param" do
        it "returns results relative to the search" do
          call_get(search: 'Dog')
          expect(parsed_response.first['id']).to eq(draft_release.public_key)
          expect(parsed_response.length).to eq(1)
        end
      end

    end

    context "with a draft status params" do
      it 'lists all the draft releases for the particular project' do
        call_get({status: 'draft'})
        expect(parsed_response.first['id']).to eq(draft_release.public_key)
        expect(parsed_response.length).to eq(1)
      end
    end

    context "with a published status params" do
      it 'lists all the draft releases for the particular project' do
        call_get({status: 'published'})
        expect(parsed_response.first['id']).to eq(release.public_key)
        expect(parsed_response.length).to eq(1)
      end
    end
  end

  context "when there are no releases" do
    it 'lists the releases for the particular project' do
      call_get
      expect(parsed_response).to eq([])
    end
  end

  context "when requesting a project not owned by team" do
    let(:project1) { create(:project, :with_team) }
    it 'lists the releases for the particular project' do
      get api_project_releases_path(project_public_key: project1.public_key), params: {},
          headers: team_auth_headers(project.team)
      expect(parsed_response).to eq({'error' => 'forbidden'})
    end
  end

  def call_get(params = {})
    get api_project_releases_path(project_public_key: project.public_key), params: params,
        headers: team_auth_headers(project.team)
  end

  def parsed_response
    JSON.parse(response.body)
  end
end
