require "rails_helper"

RSpec.describe Chore, type: :model do
  describe "relationships" do
    it { should belong_to :household }
    it { should have_many :member_chores }
    it { should have_many(:members).through(:member_chores) }
  end

  describe "validations" do
    it {
      should define_enum_for(:day).with_values(["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
                                                "Saturday"])
    }
    it { should validate_presence_of :name }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :day }
  end
end
