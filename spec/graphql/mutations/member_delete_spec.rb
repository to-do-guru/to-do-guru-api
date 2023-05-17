require 'rails_helper'

RSpec.describe Mutations::DeleteMember, type: :graphql do
  describe '#resolve' do
    let!(:household) { create(:household) }
    let!(:member1) { create(:member, household: household) }
    let!(:member2) { create(:member, household: household) }
    let!(:member3) { create(:member, household: household) }
    
    it 'starts with three household members for testing purposes' do
      
    end
  end
end