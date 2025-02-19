FactoryBot.define do
  factory :scene do
    name { Faker::Name.name }
    color { '#fff' }

    campaign
  end
end
