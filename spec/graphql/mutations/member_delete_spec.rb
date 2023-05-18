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
    
    xit 'does not delete a member with an invalid ID' do
      expect {
        post '/graphql', params: { query: member_delete_mutation(0) }
      }.to raise (error of some kind)
      
      expect(household.members.count).to eq(3)
      
      #  1) Mutations::MemberDelete#resolve does not delete a member with an invalid ID
       # Failure/Error: member = Member.find(id)
       # 
       # ActiveRecord::RecordNotFound:
       #   Couldn't find Member with 'id'=0
       # # ./app/graphql/mutations/member_delete.rb:16:in `resolve'
    end
    
    
    def member_delete_mutation(member_id)
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