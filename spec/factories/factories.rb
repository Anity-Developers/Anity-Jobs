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

  factory :category do
    sequence :name do |n|
      "Category #{n}"
    end
  end

  factory :location do
    sequence :name do |n|
      "Location #{n}"
    end
  end

  factory :company do
    name { "test-company" }
    association :location, factory: :location
  end

  factory :job do
    sequence :title do |n|
      "Job #{n}"
    end
    application_url { "http://example.com" }
    description { "test-description" }
    association :company, factory: :company
    association :location, factory: :location
    association :category, factory: :category
  end
end
