module Types
  class MutationType < Types::BaseObject
    field :create_chore, mutation: Mutations::CreateChore
  end
end
