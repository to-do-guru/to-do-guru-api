FactoryBot.define do
  factory :household do
    name { "The #{Faker::Name.last_name}'s House" }
    email { Faker::Internet.email }
  end
end
