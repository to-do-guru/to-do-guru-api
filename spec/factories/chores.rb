FactoryBot.define do
  factory :chore do
    household { nil }
    name { "MyString" }
    duration { 1 }
    day { 1 }
  end
end
