# frozen_string_literal: true

module Mutations
  class MemberDelete < BaseMutation
    description "Deletes a member by ID"
    
    argument :id, ID, required: true

    field :member, Types::MemberType, null: false


    def resolve(id:, **attributes)
      member = ::Member.find(id)
      
      # binding.pry
      raise GraphQL::ExecutionError.new "Error deleting member", extensions: member.errors.to_hash unless member.destroy
      
      { member: member }
    end
  end
end
