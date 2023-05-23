module Types
  class MutationType < Types::BaseObject
    field :member_delete, mutation: Mutations::MemberDelete
    field :create_member, mutation: Mutations::CreateMember
    field :create_chore, mutation: Mutations::CreateChore
    field :update_household, mutation: Mutations::UpdateHousehold
    field :randomize_chores, mutation: Mutations::RandomizeChores
  end
end
