class Mutations::RandomizeChores < Mutations::BaseMutation
  argument :id, ID, required: true

  field :household, Types::HouseholdType, null: true
  field :errors, [String], null: false

  def resolve(id:)
    household = Household.find(id)
    household.randomize_chores

    { household:, errors: [] }
  rescue StandardError => e
    { errors: [e] }
  end
end