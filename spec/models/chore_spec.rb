require 'rails_helper'

RSpec.describe Chore, type: :model do
  describe "relationships" do
    it { should belong_to :household }
    it { should have_many :member_chores }
  end

  describe "validations" do
    it { should define_enum_for(:day).with_values(['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']) }
  end
end
