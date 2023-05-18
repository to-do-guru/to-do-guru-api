# frozen_string_literal: true

module Mutations
  class MemberDelete < BaseMutation
    description "Deletes a member by ID"
    
    argument :id, ID, required: true

    field :member, Types::MemberType, null: false


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
    
    def resolve(id:)
      member = Member.find(id)
    
      raise GraphQL::ExecutionError.new "Error deleting member", extensions: member.errors.to_hash unless member.destroy
    
      { member: member }
    end
  end
end


# member: nil, 
# errors: member.errors.full_messages