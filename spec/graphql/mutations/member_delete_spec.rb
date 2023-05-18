require 'rails_helper'

RSpec.describe Mutations::MemberDelete, type: :graphql do
  include RSpec::Rails::RequestExampleGroup
  
  describe '#resolve' do
    let!(:household) { create(:household) }
    let!(:member1) { create(:member, household: household) }
    let!(:member2) { create(:member, household: household) }
    let!(:member3) { create(:member, household: household) }
    
    it 'starts with three household members for testing purposes' do
      expect(household.members.count).to eq(3)
    end
    
    it 'deletes a member from a household' do
      expect {
        post '/graphql', params: { query: member_delete_mutation(member1.id) }
      }.to change { Member.count }.by(-1)
      expect(household.members.count).to eq(2)
    end
    
    def member_delete_mutation(member_id)
      <<~GRAPHQL
        mutation {
          member_delete(id: "#{member_id}") {
            success
          }
        }
      GRAPHQL
    end
  end
end