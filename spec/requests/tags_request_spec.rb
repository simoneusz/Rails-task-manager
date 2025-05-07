require 'rails_helper'

RSpec.describe "Tags", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/tags/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/tags/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/tags/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/tags/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
