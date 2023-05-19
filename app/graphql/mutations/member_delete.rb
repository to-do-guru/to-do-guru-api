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
      # raise GraphQL::ExecutionError.new "Error deleting member", extensions: member.errors.to_hash unless member.destroy

      { member:, errors: [] }
    rescue StandardError => e
      { errors: [e] }
    end
  end
end


# member: nil, 
# errors: member.errors.full_messages


#     def resolve(id:)
#       member = Member.find(id)
# 
# 
#       if member.present?
#         member.destroy
#       else
#         member: nil, 
#         errors: member.errors.full_messages
#       end
# binding.pry
#       # raise GraphQL::ExecutionError.new "Error deleting member", extensions: member.errors.to_hash unless member.destroy
#       # 
#       # { member: member }
#     end