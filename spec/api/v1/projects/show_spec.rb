require 'rails_helper'

RSpec.describe "projects#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/projects/#{project.id}", params: params
  end

  describe 'basic fetch' do
    let!(:project) { create(:project) }

    it 'works' do
      expect(ProjectResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('projects')
      expect(d.id).to eq(project.id)
    end
  end
end
