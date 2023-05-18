require 'rails_helper'

RSpec.describe 'mutation create member' do
  describe 'can create a member' do
    let!(:household) { Household.create(name: "Test Household") }
    let!(:member) { Member.create(name: "Rubber Duck", household_id: household.id) }
    describe 'happy path' do

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
            new_member_id = Member.last.id.to_s
            expect(result["data"]["createMember"]["member"]["name"]).to eq("Test Member")
            expect(result["data"]["createMember"]["member"]["id"]).to eq(new_member_id)
            expect(result["data"]["createMember"]["errors"]).to eq([])
      end
    end
    describe 'sad path' do

      it 'sad path, return error if name is blank' do
        query = <<~GQL
        mutation {
          createMember(
            input: {
              name: "", 
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
            expect(result["data"]["createMember"]["member"]).to eq(nil)
            expect(result["data"]["createMember"]["errors"]).to eq(["Validation failed: Name can't be blank"])
      end
          
      it 'sad path, return error if name already exists for member' do
        query = <<~GQL
        mutation {
          createMember(
            input: {
              name: "Rubber Duck", 
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
          expect(result["data"]["createMember"]["member"]).to eq(nil)
          expect(result["data"]["createMember"]["errors"]).to eq(["Validation failed: Name has already been taken"])
       end

      it 'sad path, return error if household does not exist' do
        query = <<~GQL
        mutation {
          createMember(
            input: {
              name: "New Person", 
              householdId: "100"
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
          expect(result["data"]["createMember"]["member"]).to eq(nil)
          expect(result["data"]["createMember"]["errors"]).to eq(["Validation failed: Household must exist"])
      end
    end
  end
end
