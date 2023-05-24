require "rails_helper"
module Mutations
  RSpec.describe RandomizeChores, type: :request do
    describe "#resolve" do
      context "Happy Path" do
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

        it "returns a household id for the household that was randomized" do
          post "/graphql", params: { query: query(id: household.id) }

          household_response = JSON.parse(response.body, symbolize_names: true)

          expect(household_response[:data][:randomizeChores][:household][:id].to_i).to eq(household.id)
        end

        it "will generate member chore entries for a house hold" do
          expect(Household.find(household.id).member_chores).to eq([])

          post "/graphql", params: { query: query(id: household.id) }

          expect(Household.find(household.id).member_chores.length).to eq(9)
        end
      end

      context "Sad Path" do
        it "returns error when household not found" do
          post "/graphql", params: { query: query(id: 0) }

          household_response = JSON.parse(response.body, symbolize_names: true)

          expect(household_response[:data][:randomizeChores][:errors].first).to eq("Couldn't find Household with 'id'=0")
          expect(household_response[:data][:randomizeChores][:household]).to eq(nil)
        end
      end

      def query(id:)
        <<~GQL
          mutation {
            randomizeChores(
              input: {
                id: #{id}
              }
            ) {
              household {
                id
              }
              errors
            }
          }
        GQL
      end
    end
  end
end