require 'rails_helper'

RSpec.describe "tags#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/tags", params: params
  end

  describe 'basic fetch' do
    let!(:tag1) { create(:tag) }
    let!(:tag2) { create(:tag) }

    it 'works' do
      expect(TagResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['tags'])
      expect(d.map(&:id)).to match_array([tag1.id, tag2.id])
    end
  end
end
