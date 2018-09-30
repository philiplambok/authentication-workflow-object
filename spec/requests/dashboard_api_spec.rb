require 'rails_helper'

RSpec.describe "Dashboard API", type: :request do
  describe "User visit dashboard page" do
    context "when auth header valid" do 
      let (:user) { create(:user) }

      it "return success response" do 
        get '/dashboard', { headers: { authorization: "Bearer #{TokenService.encode(user_id: user.id)}"  } }
        expect(response.body).to include("success", "Welcome to dashboard, #{user.username}")
      end
    end

    context "when auth header empty" do 
      it "return error response" do 
        get '/dashboard'
        expect(response.body).to include("error", "Sorry, you don't have permission")
      end
    end

    context "when auth header not include 'Bearer' text " do 
      it "return error response" do 
        get '/dashboard', headers: { authorization: "INVALID TOKEN" }
        expect(response.body).to include("error", "Sorry, you don't have permission")
      end
    end

    context "when auth header have invalid format" do 
      it "return error response" do 
        get '/dashboard', headers: { authorization: "Bearer" }
        expect(response.body).to include("error", "Sorry, you don't have permission")
      end
    end

    context "when auth header have token that can't decoded" do 
      it "return error response" do 
        get '/dashboard', headers: { authorization: "Bearer bad_token_just_passing_through" }
        expect(response.body).to include("error", "Sorry, you don't have permission")
      end
    end
  end
end
