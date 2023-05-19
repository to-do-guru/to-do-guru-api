class Mutations::CreateChore < Mutations::BaseMutation
  argument :household_id, ID, required: true
  argument :name, String, required: true
  argument :duration, Int, required: true
  argument :day, [String], required: true

  field :chores, [Types::ChoreType], null: true
  field :errors, [String], null: false

  def resolve(household_id:, name:, duration:, day:)
    days = day
    created_chores = []
    chore_errors = []
    days.each do |day_of_week|
      chore = Chore.new(household_id:, name:, duration:, day: day_of_week)
      if chore.save
        created_chores << chore
      else
        chore_errors << chore.errors.full_messages
      end
    end
    if chore_errors.empty? && created_chores.empty? == false
      {
        chores: created_chores,
        errors: []
      }
    else
      {
        chores: nil,
        errors: chore_errors
      }
    end
  end
end