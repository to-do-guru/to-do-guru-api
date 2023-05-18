module Mutations
  class UpdateHousehold < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :email, String, required: false

    field :household, Types::HouseholdType, null: true
    field :errors, [String], null: false

    def resolve(id:, **attributes)
      household = Household.find(id)

      if household.update(attributes)
        { household: household, errors: [] }
      else
        { household: nil, errors: household.errors.full_messages }
      end

    rescue ActiveRecord::RecordNotFound
      return { household: nil, errors: ["Record Not Found"] }
    end
  end
end