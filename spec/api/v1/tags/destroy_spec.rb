require 'rails_helper'

RSpec.describe "tags#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/tags/#{tag.id}"
  end

  describe 'basic destroy' do
    let!(:tag) { create(:tag) }

    it 'updates the resource' do
      expect(TagResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Tag.count }.by(-1)
      expect { tag.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
