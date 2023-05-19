require 'rails_helper'

RSpec.describe Mutations::MemberDelete, type: :graphql do
  include RSpec::Rails::RequestExampleGroup
  
  describe '#resolve' do
    let!(:household) { create(:household) }
    let!(:member1) { create(:member, household: household) }
    let!(:member2) { create(:member, household: household) }
    let!(:member3) { create(:member, household: household) }
    
    describe 'happy path testing' do
      it 'starts with three household members for testing purposes' do
        expect(household.members.count).to eq(3)
      end
      
      it 'deletes a member from a household' do
        expect {
          post '/graphql', params: { query: query(member1.id) }
        }.to change { Member.count }.by(-1)
        
        expect(household.members.count).to eq(2)
      end
    end
    
    describe 'sad path testing' do
      it 'does not delete a member with an invalid ID' do
        # Initial count is 3, as expected
        expect(household.members.count).to eq(3)
        
        post '/graphql', params: { query: query(0) }

        expect(response.status).to eq(200)  # Check that the request was successful

        # Assert that the member count remains the same because there was no member to destroy
        expect(household.members.count).to eq(3)

        json_response = JSON.parse(response.body, symbolize_names: true)
        
        expect(json_response[:data][:memberDelete][:member]).to be_nil
      end
    end
    
    
    def query(member_id)
      <<~GRAPHQL
        mutation {
          memberDelete(input: {id: #{member_id}}) {
            member {name}
          }
        }
      GRAPHQL
    end
  end
end