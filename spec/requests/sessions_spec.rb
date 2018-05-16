require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    it "should prompt for login" do
      get login_url
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /login" do
    let(:user) { FactoryBot.create(:user) }

    it "should login" do
      post "/login", params: { name: user.name, password: user.password}
      expect(response).to redirect_to admin_path
      expect(session[:user_id]).to equal(user.id)
    end

    it "should fail login" do
      post "/login", params: { name: user.name, password: 'wrong'}
      expect(response).to redirect_to login_path
    end
  end

  describe "DELETE /logout" do
    it "should logout" do
      delete "/logout"
      expect(response).to redirect_to root_path
    end
  end
end
