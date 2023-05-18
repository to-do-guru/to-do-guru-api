# frozen_string_literal: true

module Mutations
  class MemberDelete < BaseMutation
    description "Deletes a member by ID"
    
    argument :id, ID, required: true

    field :member, Types::MemberType, null: true


    def resolve(id:)#, **attributes)
      
      
      # require 'pry';binding.pry
      member = Member.find(id)
      # member.destroy
      # binding.pry
      raise GraphQL::ExecutionError.new "Error deleting member", extensions: member.errors.to_hash unless member.destroy
      
      { member: member }
    end
  end
end
