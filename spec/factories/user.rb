FactoryBot.define do
  factory :user do
    email { "admin@mail.com" }
    password { "12345678"}
    password_confirmation { "12345678"}
  end
end