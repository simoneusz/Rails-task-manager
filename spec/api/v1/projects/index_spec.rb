require 'rails_helper'

RSpec.describe "projects#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/projects", params: params
  end

  describe 'basic fetch' do
    let!(:project1) { create(:project) }
    let!(:project2) { create(:project) }

    it 'works' do
      expect(ProjectResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['projects'])
      expect(d.map(&:id)).to match_array([project1.id, project2.id])
    end
  end
end
