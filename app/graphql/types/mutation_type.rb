module Types
  class MutationType < Types::BaseObject
    field :create_chore, mutation: Mutations::CreateChore
    
    field :update_household, mutation: Mutations::UpdateHousehold
  end
end
