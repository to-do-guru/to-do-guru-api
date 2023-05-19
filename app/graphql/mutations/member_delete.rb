# frozen_string_literal: true

module Mutations
  class MemberDelete < BaseMutation
    description "Deletes a member by ID"
    
    argument :id, ID, required: true

    field :member, Types::MemberType, null: true
    field :errors, [String], null: false
    
    def resolve(id:, **attributes)
      member = Member.find(id)
      
      member.destroy
      
      { member:, errors: [] }
    rescue StandardError => e
      { errors: [e] }
    end
  end
end