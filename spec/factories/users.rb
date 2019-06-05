FactoryBot.define do
  factory :user do
    email { "MyString" }
    password_digest { "MyString" }
    api_key { SecureRandom.hex(32) }
  end
end
