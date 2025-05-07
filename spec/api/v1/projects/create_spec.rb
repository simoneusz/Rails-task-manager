require 'rails_helper'

RSpec.describe "projects#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/projects", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:project)
    end
    let(:payload) do
      {
        data: {
          type: 'projects',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ProjectResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Project.count }.by(1)
    end
  end
end
