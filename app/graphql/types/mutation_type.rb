module Types
  class MutationType < Types::BaseObject
    field :member_delete, mutation: Mutations::MemberDelete
    field :update_household, mutation: Mutations::UpdateHousehold
  end
end
