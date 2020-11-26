require 'rails_helper'

RSpec.describe "SupplyUserNotifications", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/supply_user_notifications/index"
      expect(response).to have_http_status(:success)
    end
  end

end
