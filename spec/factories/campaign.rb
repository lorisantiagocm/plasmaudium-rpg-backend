FactoryBot.define do
  factory :campaign do
    name { Faker::Name.name }
    description { Faker::Name.name }

    user
  end
end
