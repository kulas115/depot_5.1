require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do
    it "should create user" do
      expect {
        post "/users", params: { user: { name: 'sam', password: 'foobar', password_confirmation: 'foobar'}}
      }.to change(User, :count).by(1)

      expect(response).to redirect_to users_path
    end
  end

  describe "PATCH /user" do
    it "should update user" do
      user = FactoryBot.create(:user)

      patch "/users/#{user.id}", params: { user: { name: 'sam', password: 'foobar', password_confirmation: 'foobar'}}

      expect(response).to redirect_to users_path
    end
  end
end
