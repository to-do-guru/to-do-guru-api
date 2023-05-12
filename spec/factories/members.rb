FactoryBot.define do
  factory :member do
    household { create(:household) }
    name { Faker::Name.first_name }
  end
end
