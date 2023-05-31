FactoryBot.define do
  factory :customer do
    email { "MyString" }
    stripe_custoomer_id { "MyString" }
    user { nil }
  end
end
