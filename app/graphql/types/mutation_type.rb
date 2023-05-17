module Types
  class MutationType < Types::BaseObject
    field :deleteMember, mutation: Mutations::DeleteMember
  end
end
