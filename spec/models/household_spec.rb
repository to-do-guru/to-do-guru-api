require "rails_helper"

RSpec.describe Household, type: :model do
  describe "relationships" do
    it { should have_many :chores }
    it { should have_many :members }
  end

  context 'instance methods' do
    describe '#randomize_chores' do
      let!(:household) { create(:household) }
      let!(:member1) { create(:member, household: household) }
      let!(:member2) { create(:member, household: household) }
      let!(:chore1) { create(:chore, household: household, duration: 30) }
      let!(:chore2) { create(:chore, household: household, duration: 45) }
      let!(:chore3) { create(:chore, household: household, duration: 60) }
      let!(:chore4) { create(:chore, household: household, duration: 30) }

      it 'creates memberchores to evenly distribute chores' do
        household.randomize_chores

        # distribute as evenly as possible
        expect(member1.chores).to eq([chore1, chore2])
        expect(member2.chores).to eq([chore3, chore4])
      end
    end
  end
end
