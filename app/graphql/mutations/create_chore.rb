class Mutations::CreateChore < Mutations::BaseMutation
  argument :household_id, ID, required: true
  argument :name, String, required: true
  argument :duration, Int, required: true
  argument :day, [String], required: true

  field :chores, [Types::ChoreType], null: true
  field :errors, [String], null: false

  def resolve(household_id:, name:, duration:, day:)
    created_chores = []
    day.each do |day_of_week|
      chore = Chore.new(household_id:, name:, duration:, day: day_of_week)
      created_chores << chore if chore.save!
    end

    { chores: created_chores, errors: [] }
  rescue StandardError => e
    { errors: [e] }
  end
end