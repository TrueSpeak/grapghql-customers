FactoryBot.define do
  factory :customer do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
  end
end
