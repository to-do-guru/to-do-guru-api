module Types
  class MutationType < Types::BaseObject
    field :member_delete, mutation: Mutations::MemberDelete
  end
end
