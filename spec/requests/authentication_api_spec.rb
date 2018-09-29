require 'rails_helper'

RSpec.describe "Authentication API", type: :request do
  describe "User login" do
    context "when credentials valid" do
      let (:user) { create(:user) }

      it "return's token" do
        post '/authentication', params: { auth: {username: user.username, password: user.password } }
        expect(response.body).to include("jwt", JWT.encode({user_id: user.id}, nil, 'none') )
      end
    end

    context "when credentials invalid" do
      let (:user) { build(:user) }

      it "return's error response" do
        post '/authentication', params: { auth: {username: user.username, password: user.password } }
        expect(response.body).to include("error", "Sorry, you're credentials is invalid")
      end
    end
  end
end
