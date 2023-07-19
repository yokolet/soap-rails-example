require 'rails_helper'

RSpec.describe "Airbags", type: :request do
  describe "GET /get" do
    it "returns http success" do
      get "/airbag/get"
      expect(response).to have_http_status(:success)
    end
  end

end
