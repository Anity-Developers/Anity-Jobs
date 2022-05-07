FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :role do
    name { "user" }
  end

  factory :user do
    email
    password { "password" }
    role
  end

  factory :company do
    name { "test-company" }
  end
end
