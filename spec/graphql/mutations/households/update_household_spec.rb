require "rails_helper"
module Mutations
  RSpec.describe UpdateHousehold, type: :request do
    describe "#instance methods" do
      describe "#resolve" do
        before(:each) do
          @household = Household.create!(email: "original@example.com", name: "Original Household Name")
        end

        it "updates a household" do
          expect(@household.name).to eq("Original Household Name")
          expect(@household.email).to eq("original@example.com")
          
          post '/graphql', params: { query: query(id: @household.id) }

          updated_household = Household.find(@household.id)

          expect(updated_household.name).to eq("New Household Name")
          expect(updated_household.email).to eq("new_email@example.com")
        end

        it "returns the updated household" do
          post '/graphql', params: { query: query(id: @household.id) }
          
          household_response = JSON.parse(response.body, symbolize_names: true)

          expect(household_response.keys).to include(:data)
          expect(household_response[:data].keys).to include(:updateHousehold)
          expect(household_response[:data][:updateHousehold].keys).to include(:household, :errors)
         
          expect(household_response[:data][:updateHousehold][:household].keys).to include(:id, :email, :name)
          expect(household_response[:data][:updateHousehold][:household][:id]).to eq(@household.id.to_s)
          expect(household_response[:data][:updateHousehold][:household][:email]).to eq("new_email@example.com")
          expect(household_response[:data][:updateHousehold][:household][:name]).to eq("New Household Name")
          expect(household_response[:data][:updateHousehold][:errors]).to eq([])
        end
      end  

      def query(id:)
        <<~GQL
          mutation {
            updateHousehold(
              input: {
                id: #{id}
                email: "new_email@example.com"
                name: "New Household Name" 
              }
            ) {
              household {
                id
                email
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