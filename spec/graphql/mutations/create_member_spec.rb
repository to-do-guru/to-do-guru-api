require 'rails_helper'

RSpec.describe 'mutation create member' do
  describe 'can create a member' do
    let!(:household) { Household.create(name: "Test Household") }
    it 'happy path for creating a user' do

      query = <<~GQL
      mutation {
        createMember(
          input: {
            name: "Test Member", 
            householdId: "#{household.id}"
            }) {
              member {
                id,
                name
              }
              errors
            }
          }
          GQL
          
          
          result = ToDoGuruApiSchema.execute(query)
          expect(result["data"]["createMember"]["member"]["name"]).to eq("Test Member")
          expect(result["data"]["createMember"]["member"]["id"]).to eq(household.id.to_s)
          expect(result["data"]["createMember"]["errors"]).to eq([])
    end
  end

  it 'sad path, return error if name is blank' do
    query = <<~GQL
    mutation {
      createMember(
        input: {
          name: "", 
          householdId: "1"
        }) {
            member {
            id,
            name
            }
            errors
          }
      }
    GQL

    result = ToDoGuruApiSchema.execute(query)
    binding.pry
    expect(result["data"]["createMember"]).to eq(nil)
    expect(result["errors"][0]["message"]).to eq("Argument 'name' on InputObject 'CreateMemberInput' has an invalid value (\"\"). Expected type 'String!'.")
  end
end