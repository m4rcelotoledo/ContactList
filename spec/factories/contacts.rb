FactoryBot.define do
  factory :contact do
    email { Faker::Internet.unique.email }
    name { Faker::Books::Dune.character }
    guid { SecureRandom.uuid }
  end
end
