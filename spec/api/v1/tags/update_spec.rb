require 'rails_helper'

RSpec.describe "tags#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/tags/#{tag.id}", payload
  end

  describe 'basic update' do
    let!(:tag) { create(:tag) }

    let(:payload) do
      {
        data: {
          id: tag.id.to_s,
          type: 'tags',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(TagResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { tag.reload.attributes }
    end
  end
end
