require "rails_helper"

RSpec.describe Household, type: :model do
  describe "relationships" do
    it { should have_many :chores }
    it { should have_many :members }
  end
end
