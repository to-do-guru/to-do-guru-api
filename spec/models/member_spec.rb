require "rails_helper"

RSpec.describe Member, type: :model do
  describe "relationships" do
    it { should belong_to :household }
    it { should have_many :member_chores }
    it { validate_uniqueness_of :name }
    it { validate_presence_of :name }
  end
end
