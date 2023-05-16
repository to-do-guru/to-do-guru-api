module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    field :household, Types::HouseholdType, null: false, description: "returns one household" do
      argument :email, String, required: true
    end

    def household(email:)
      Household.find_by(email: email)
    end
  end
end
