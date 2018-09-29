FactoryBot.define do
  factory :user do
    username { "MyString" }
    password { "MySecretString" }
    password_confirmation { "MySecretString" }
  end
end
