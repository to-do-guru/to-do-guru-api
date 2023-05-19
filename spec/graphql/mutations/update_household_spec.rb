require "rails_helper"

module Mutations
  RSpec.describe UpdateHousehold, type: :request do
    describe "#instance methods" do
      describe "#resolve" do
        before(:each) do
          @household = Household.create!(name: "Original Household Name")
        end

        it "updates a household" do
          expect(@household.name).to eq("Original Household Name")

          post "/graphql", params: { query: query(id: @household.id) }

          updated_household = Household.find(@household.id)

          expect(updated_household.name).to eq("New Household Name")
        end

        it "returns the updated household" do
          post "/graphql", params: { query: query(id: @household.id) }

          household_response = JSON.parse(response.body, symbolize_names: true)

          expect(household_response.keys).to include(:data)
          expect(household_response[:data].keys).to include(:updateHousehold)
          expect(household_response[:data][:updateHousehold].keys).to include(:household, :errors)

          expect(household_response[:data][:updateHousehold][:household].keys).to include(:id, :name)
          expect(household_response[:data][:updateHousehold][:household][:id]).to eq(@household.id.to_s)
          expect(household_response[:data][:updateHousehold][:household][:name]).to eq("New Household Name")
          expect(household_response[:data][:updateHousehold][:errors]).to eq([])
        end

        it "returns null household object with error message when record not found" do
          post "/graphql", params: { query: query(id: 0) }

          household_response = JSON.parse(response.body, symbolize_names: true)

          expect(household_response.keys).to include(:data)
          expect(household_response[:data].keys).to include(:updateHousehold)
          expect(household_response[:data][:updateHousehold].keys).to include(:household, :errors)

          expect(household_response[:data][:updateHousehold][:household]).to eq(nil)
          expect(household_response[:data][:updateHousehold][:errors]).to eq(["Couldn't find Household with 'id'=0"])
        end
      end

      def query(id:)
        <<~GQL
          mutation {
            updateHousehold(
              input: {
                id: #{id}
                name: "New Household Name"#{' '}
              }
            ) {
              household {
                id
                name
              }
              errors
            }
          }
        GQL
      end
    end
  end
end