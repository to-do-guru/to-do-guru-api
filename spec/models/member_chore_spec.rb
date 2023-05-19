require "rails_helper"

RSpec.describe MemberChore, type: :model do
  describe "relationships" do
    it { should belong_to :member }
    it { should belong_to :chore }
  end
end
