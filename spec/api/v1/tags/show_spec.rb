require 'rails_helper'

RSpec.describe "tags#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/tags/#{tag.id}", params: params
  end

  describe 'basic fetch' do
    let!(:tag) { create(:tag) }

    it 'works' do
      expect(TagResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('tags')
      expect(d.id).to eq(tag.id)
    end
  end
end
