module Types
  class MutationType < Types::BaseObject
    field :member_delete, mutation: Mutations::MemberDelete
    field :create_member, mutation: Mutations::CreateMember
    field :update_household, mutation: Mutations::UpdateHousehold
  end
end
