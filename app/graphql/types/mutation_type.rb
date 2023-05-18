module Types
  class MutationType < Types::BaseObject
    field :create_member, mutation: Mutations::CreateMember
  end
end
