FactoryBot.define do
  factory :member_chore do
    member { create(:member) }
    chore { create(:chore) }
  end
end
