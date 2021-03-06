require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with username, password and password_confirmation" do 
    user = build(:user)
    user.valid? 
    expect(user.errors).to be_empty
  end

  it "is invalid without username" do 
    user = build(:user, username: nil)
    user.valid? 
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid without password" do
    user = build(:user, password: nil)
    user.valid? 
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid with password_confirmation does't match " do
    user = build(:user, password_confirmation: "no")
    user.valid? 
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end
end
