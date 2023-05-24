require "rails_helper"

RSpec.describe Household, type: :model do
  describe "relationships" do
    it { should have_many :chores }
    it { should have_many :members }
    it { should have_many(:member_chores).through(:members) }
  end

  context "instance methods" do
    describe "#randomize_chores" do
      let!(:household) { create(:household) }
      let!(:household2) { create(:household) }

      let!(:member1) { create(:member, household:) }
      let!(:member2) { create(:member, household:) }
      let!(:member3) { create(:member, household:) }
      let!(:member4) { create(:member, household: household2) }

      let!(:chore1) { create(:chore, name: "chore1", household:, duration: 15) }
      let!(:chore2) { create(:chore, name: "chore2", household:, duration: 15) }
      let!(:chore3) { create(:chore, name: "chore3", household:, duration: 15) }
      let!(:chore4) { create(:chore, name: "chore4", household:, duration: 30) }
      let!(:chore5) { create(:chore, name: "chore5", household:, duration: 30) }
      let!(:chore6) { create(:chore, name: "chore6", household:, duration: 30) }
      let!(:chore7) { create(:chore, name: "chore7", household:, duration: 30) }
      let!(:chore8) { create(:chore, name: "chore8", household:, duration: 45) }
      let!(:chore9) { create(:chore, name: "chore9", household:, duration: 45) }
      let!(:chore10) { create(:chore, name: "chore10", household: household2, duration: 45) }
      let!(:member_chore10) { create(:member_chore, member: member4, chore: chore10) }

      it "creates member chores that are evenly distributed" do
        household.randomize_chores

        Household.find(household.id).members.each do |member|
          expect(total_chore_duration(member)).to be >= 60
          expect(total_chore_duration(member)).to be <= 115
        end
      end

      it "creates member chores that are randomly distributed" do
        household.randomize_chores

        original_member_chores = Household.find(household.id).members.index_with do |member|
          member.chores.map do |chore|
            chore.id
          end
        end

        Household.find(household.id).randomize_chores

        new_member_chores = Household.find(household.id).members.index_with do |member|
          member.chores.map do |chore|
            chore.id
          end
        end

        expect(original_member_chores).to_not eq(new_member_chores)
      end

      it "deletes old household member chore entries" do
        household.randomize_chores

        original_member_chores = Household.find(household.id).member_chores.map { |member_chore| member_chore.id }

        original_member_chores.each do |member_chore|
          expect(MemberChore.find(member_chore)).to_not be(nil)
        end

        Household.find(household.id).randomize_chores

        original_member_chores.each do |member_chore|
          expect { MemberChore.find(member_chore) }.to raise_error(ActiveRecord::RecordNotFound)
        end

        expect(household2.member_chores.count).to eq(1)
      end

      it "returns a hash with an empty array for each member when household has no chores to be randomized" do
        household3 = create(:household)

        member_1 = create(:member, household: household3)
        member_2 = create(:member, household: household3)

        expected_result = {
          member_1.id => [],
          member_2.id => []
        }

        expect(household3.randomize_chores).to eq(expected_result)
      end

      def total_chore_duration(member)
        member.chores.sum { |chore| chore.duration }
      end
    end
  end
end
