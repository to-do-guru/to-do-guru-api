module Mutations
  class UpdateHousehold < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false

    field :household, Types::HouseholdType, null: true
    field :errors, [String], null: false

    def resolve(id:, **attributes)
      household = Household.find(id)

      household.update!(attributes)

      { household:, errors: [] }
    rescue StandardError => e
      { errors: [e] }
    end
  end
end