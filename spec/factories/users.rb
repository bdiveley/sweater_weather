FactoryBot.define do
  factory :user do
    email { "sample@gmail.com" }
    password { "test" }
    api_key { "abc123" }
  end
end
