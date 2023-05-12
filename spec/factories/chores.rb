FactoryBot.define do
  factory :chore do
    household { create(:household) }
    name { Faker::Lorem.sentence(word_count: 3) }
    duration { Faker::Number.between(from: 1, to: 4) * 15 }
    day { Faker::Number.between(from: 0, to: 6) }
  end
end
