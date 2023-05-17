module Types
  class MutationType < Types::BaseObject
    field :member_delete, mutation: Mutations::MemberDelete
    field :deleteMember, mutation: Mutations::DeleteMember
  end
end
