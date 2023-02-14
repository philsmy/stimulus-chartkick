require 'rails_helper'

RSpec.describe "Charttests", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/charttest/index"
      expect(response).to have_http_status(:success)
    end
  end

end
