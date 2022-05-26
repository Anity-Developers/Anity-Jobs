FactoryBot.define do

  factory :role do
    name { Role.names.keys.sample }

    to_create do |instance|
      instance.id = Role.find_or_create_by(name: instance.name).id
      instance.reload
    end
  end

  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end

    password { "password" }

    association :role, factory: :role, name: 'user'

    trait :admin do
      association :role, factory: :role, name: 'admin'
    end
  end

  factory :company do
    name { "test-company" }
  end

  factory :job do
    id { SecureRandom.uuid }
    title { "test-job" }
    application_url { "http://example.com" }
    description { "test-description" }
    association :company, factory: :company
    created_at { Time.now }
    updated_at { Time.now }
  end
end
