# frozen_string_literal: true

module Mutations
  class MemberDelete < BaseMutation
    description "Deletes a member by ID"

    field :member, Types::MemberType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      member = ::Member.find(id)
      raise GraphQL::ExecutionError.new "Error deleting member", extensions: member.errors.to_hash unless member.destroy

      { member: member }
    end
  end
end
